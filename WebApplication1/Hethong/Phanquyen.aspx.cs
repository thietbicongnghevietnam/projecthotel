using System;
using System.Collections.Generic;
using System.Data;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;
using WebApplication1.App_Code;
using ZXing.Common;

namespace WebApplication1.Hethong
{
    public partial class Phanquyen : BasePage
    {
        private static readonly string[] ACTIONS = { "VIEW", "ADD", "EDIT", "DELETE", "PRINT", "EXPORT", "APPROVE" };
        private static readonly Dictionary<string, string> ACTION_NAMES = new Dictionary<string, string>
        {
            { "VIEW", "Xem" }, { "ADD", "Thêm" }, { "EDIT", "Sửa" }, { "DELETE", "Xóa" },
            { "PRINT", "In" }, { "EXPORT", "Xuất Excel" }, { "APPROVE", "Duyệt" }
        };

        private string _lastGroup;

        protected override string RequiredPermission
        {
            get { return "SYS_PHANQUYEN.VIEW"; }
        }

        protected bool CanEdit
        {
            get { return Auth.Has("SYS_PHANQUYEN.EDIT"); }
        }

        protected int SelectedRoleId
        {
            get { return ViewState["RoleId"] == null ? 0 : (int)ViewState["RoleId"]; }
            set { ViewState["RoleId"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable roles = DataConn.StoreFillDS("pro_role_list", CommandType.StoredProcedure);
                int first = roles.Rows.Count > 0 ? Convert.ToInt32(roles.Rows[0]["ROLE_ID"]) : 0;
                LoadRole(first);
            }

            pnlRoleForm.Visible = CanEdit;
            btnSave.Visible = CanEdit;
        }

        // ================= NHÓM =================

        private DataTable BindRoles()
        {
            DataTable dt = DataConn.StoreFillDS("pro_role_list", CommandType.StoredProcedure);
            rptRoles.DataSource = dt;
            rptRoles.DataBind();
            return dt;
        }

        private void LoadRole(int roleId)
        {
            SelectedRoleId = roleId;
            DataTable roles = BindRoles();

            DataRow[] rows = roles.Select("ROLE_ID = " + roleId);
            if (rows.Length == 0)
            {
                SelectedRoleId = 0;
                pnlMatrix.Visible = false;
                ResetRoleForm();
                return;
            }

            DataRow r = rows[0];
            string code = r["ROLE_CODE"].ToString();

            hfRoleEditId.Value = roleId.ToString();
            txtRoleCode.Text = code;
            txtRoleCode.Enabled = false;                       // không cho đổi mã nhóm đã có
            txtRoleName.Text = r["ROLE_NAME"].ToString();
            chkRoleActive.Checked = Convert.ToBoolean(r["IS_ACTIVE"]);
            lblRoleFormTitle.Text = "Sửa nhóm";
            btnRoleDelete.Visible = code != "ADMIN";

            litRoleTitle.Text = HttpUtility.HtmlEncode(r["ROLE_NAME"] + " (" + code + ")");
            BindMatrix();
        }

        private void ResetRoleForm()
        {
            hfRoleEditId.Value = "0";
            txtRoleCode.Text = "";
            txtRoleCode.Enabled = true;
            txtRoleName.Text = "";
            chkRoleActive.Checked = true;
            lblRoleFormTitle.Text = "Thêm nhóm mới";
            btnRoleDelete.Visible = false;
        }

        protected void rptRoles_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                LoadRole(Convert.ToInt32(e.CommandArgument));
            }
        }

        protected void btnRoleNew_Click(object sender, EventArgs e)
        {
            ResetRoleForm();
            txtRoleCode.Focus();
        }

        protected void btnRoleSave_Click(object sender, EventArgs e)
        {
            Auth.Require("SYS_PHANQUYEN.EDIT");

            int id = Convert.ToInt32(hfRoleEditId.Value);
            string code = txtRoleCode.Text.Trim().ToUpper();
            string name = txtRoleName.Text.Trim();

            if (id == 0 && !Regex.IsMatch(code, "^[A-Z0-9_]{2,50}$"))
            {
                ShowMsg("Mã nhóm chỉ gồm chữ A-Z, số, dấu _ (2-50 ký tự).", false);
                return;
            }
            if (name.Length == 0)
            {
                ShowMsg("Vui lòng nhập tên nhóm.", false);
                return;
            }

            DataTable dt = DataConn.StoreFillDS("pro_role_save", CommandType.StoredProcedure,
                                                id, code, name, chkRoleActive.Checked ? 1 : 0);
            string result = dt.Rows[0]["RESULT"].ToString();

            if (result == "DUP") { ShowMsg("Mã nhóm '" + code + "' đã tồn tại.", false); return; }
            if (result == "ADMIN") { ShowMsg("Không thể ngừng hoạt động nhóm ADMIN.", false); return; }

            LoadRole(Convert.ToInt32(dt.Rows[0]["ROLE_ID"]));
            ShowMsg(id == 0 ? "Đã thêm nhóm mới. Hãy tick quyền cho nhóm rồi bấm Lưu phân quyền." : "Đã lưu nhóm.", true);
        }

        protected void btnRoleDelete_Click(object sender, EventArgs e)
        {
            Auth.Require("SYS_PHANQUYEN.EDIT");

            int id = Convert.ToInt32(hfRoleEditId.Value);
            if (id == 0) return;

            DataTable dt = DataConn.StoreFillDS("pro_role_delete", CommandType.StoredProcedure, id);
            string result = dt.Rows[0]["RESULT"].ToString();

            if (result == "ADMIN") { ShowMsg("Không thể xóa nhóm ADMIN.", false); return; }
            if (result == "HASUSER") { ShowMsg("Nhóm còn người dùng, hãy chuyển họ sang nhóm khác trước khi xóa.", false); return; }

            DataTable roles = DataConn.StoreFillDS("pro_role_list", CommandType.StoredProcedure);
            LoadRole(roles.Rows.Count > 0 ? Convert.ToInt32(roles.Rows[0]["ROLE_ID"]) : 0);
            ShowMsg("Đã xóa nhóm.", true);
        }

        // ================= LƯỚI QUYỀN =================

        private void BindMatrix()
        {
            _lastGroup = null;
            DataTable dt = DataConn.StoreFillDS("pro_role_get_matrix", CommandType.StoredProcedure, SelectedRoleId);
            rptMatrix.DataSource = dt;
            rptMatrix.DataBind();
            pnlMatrix.Visible = true;
        }

        protected void rptMatrix_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem) return;

            DataRowView drv = (DataRowView)e.Item.DataItem;

            // Dòng tiêu đề nhóm menu
            string group = drv["GROUP_NAME"].ToString();
            Literal litGroup = (Literal)e.Item.FindControl("litGroup");
            if (group != _lastGroup)
            {
                litGroup.Text = "<tr class='pq-group'><td colspan='9'>" + HttpUtility.HtmlEncode(group) + "</td></tr>";
                _lastGroup = group;
            }

            bool canEdit = CanEdit;
            string moduleName = drv["MODULE_NAME"].ToString();

            foreach (string a in ACTIONS)
            {
                CheckBox chk = (CheckBox)e.Item.FindControl("chk" + a);
                HiddenField hf = (HiddenField)e.Item.FindControl("hf" + a);
                object permId = drv["P_" + a];

                if (permId == DBNull.Value)
                {
                    chk.Visible = false;
                    hf.Value = "";
                    continue;
                }

                hf.Value = permId.ToString();
                chk.Checked = Convert.ToInt32(drv["C_" + a]) == 1;
                chk.Enabled = canEdit;
                chk.InputAttributes["class"] = "pq-chk";
                chk.InputAttributes["data-col"] = a;
                chk.InputAttributes["title"] = ACTION_NAMES[a] + " - " + moduleName;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Auth.Require("SYS_PHANQUYEN.EDIT");
            if (SelectedRoleId == 0) return;

            List<string> ids = new List<string>();
            foreach (RepeaterItem item in rptMatrix.Items)
            {
                foreach (string a in ACTIONS)
                {
                    CheckBox chk = (CheckBox)item.FindControl("chk" + a);
                    HiddenField hf = (HiddenField)item.FindControl("hf" + a);
                    int permId;
                    if (chk.Visible && chk.Checked && int.TryParse(hf.Value, out permId))
                        ids.Add(permId.ToString());
                }
            }

            DataConn.StoreFillDS("pro_role_save_permissions", CommandType.StoredProcedure,
                                 SelectedRoleId, string.Join(",", ids));

            // Nạp lại quyền của chính người đang đăng nhập (phòng khi sửa nhóm của mình)
            Auth.LoadPermissions(Convert.ToInt32(Session["userid"]));

            LoadRole(SelectedRoleId);
            ShowMsg("Đã lưu phân quyền (" + ids.Count + " quyền). Người dùng thuộc nhóm cần đăng nhập lại để áp dụng.", true);
        }

        // ================= TIỆN ÍCH =================

        private void ShowMsg(string text, bool ok)
        {
            pnlMsg.Visible = true;
            pnlMsg.CssClass = ok ? "alert alert-success" : "alert alert-danger";
            litMsg.Text = HttpUtility.HtmlEncode(text);
        }
    }
}
