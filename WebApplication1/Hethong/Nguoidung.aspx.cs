using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.App_Code;
using System.Web.Services;

namespace WebApplication1.Hethong
{
    public partial class Nguoidung : BasePage
    {
        protected override string RequiredPermission
        {
            get { return "SYS_NGUOIDUNG.VIEW"; }
        }

        private int CurrentUserId
        {
            get { return Convert.ToInt32(Session["userid"]); }
        }

        protected bool CanAdd { get { return Auth.Has("SYS_NGUOIDUNG.ADD"); } }
        protected bool CanEdit { get { return Auth.Has("SYS_NGUOIDUNG.EDIT"); } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRoles();
                BindUsers();
                ResetForm();

                // Sau khi lưu bằng AJAX, trang được mở lại với ?id=..&saved=..
                int id;
                if (int.TryParse(Request.QueryString["id"], out id) && id > 0)
                {
                    LoadUser(id);
                    string saved = Request.QueryString["saved"];
                    if (saved == "add") ShowMsg("Đã thêm người dùng.", true);
                    else if (saved == "edit") ShowMsg("Đã lưu thay đổi.", true);
                }
            }
        }

        private void BindRoles()
        {
            DataTable dt = DataConn.StoreFillDS("pro_role_list", CommandType.StoredProcedure);
            cblRoles.DataSource = dt;
            cblRoles.DataTextField = "ROLE_NAME";
            cblRoles.DataValueField = "ROLE_ID";
            cblRoles.DataBind();
        }

        private void BindUsers()
        {
            gvUsers.DataSource = DataConn.StoreFillDS("pro_user_list", CommandType.StoredProcedure);
            gvUsers.DataBind();
        }

        private void ResetForm()
        {
            hfUserId.Value = "0";
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtPassword.Attributes["placeholder"] = "Bắt buộc với người dùng mới";
            txtFullName.Text = "";
            txtEmail.Text = "";
            chkActive.Checked = true;
            chkActive.Enabled = true;
            foreach (ListItem li in cblRoles.Items) li.Selected = false;

            lblFormTitle.Text = "Thêm người dùng";
            pnlForm.Visible = Auth.Has("SYS_NGUOIDUNG.ADD") || Auth.Has("SYS_NGUOIDUNG.EDIT");
            btnSave.Visible = Auth.Has("SYS_NGUOIDUNG.ADD") || Auth.Has("SYS_NGUOIDUNG.EDIT");
            btnNew.Visible = Auth.Has("SYS_NGUOIDUNG.ADD");
        }

        private void LoadUser(int id)
        {
            DataTable dt = DataConn.StoreFillDS("pro_user_get", CommandType.StoredProcedure, id);
            if (dt.Rows.Count == 0) { ShowMsg("Không tìm thấy người dùng.", false); return; }

            DataRow r = dt.Rows[0];
            hfUserId.Value = id.ToString();
            txtUserName.Text = Convert.ToString(r["U_NAME"]);
            txtPassword.Text = "";
            txtPassword.Attributes["placeholder"] = "Để trống nếu không đổi mật khẩu";
            txtFullName.Text = Convert.ToString(r["U_FULLNAME"]);
            txtEmail.Text = Convert.ToString(r["U_EMAIL"]);
            chkActive.Checked = Convert.ToString(r["U_ACTIVE"]) == "Y";
            chkActive.Enabled = id != CurrentUserId;          // không tự khóa chính mình

            string[] roleIds = Convert.ToString(r["ROLE_IDS"]).Split(',');
            foreach (ListItem li in cblRoles.Items) li.Selected = roleIds.Contains(li.Value);

            lblFormTitle.Text = "Sửa người dùng: " + HttpUtility.HtmlEncode(txtUserName.Text);
            pnlForm.Visible = true;
            btnSave.Visible = Auth.Has("SYS_NGUOIDUNG.ADD") || Auth.Has("SYS_NGUOIDUNG.EDIT");
        }

        protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;

            int id = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "U_ID"));
            bool canEdit = Auth.Has("SYS_NGUOIDUNG.EDIT");

            e.Row.FindControl("btnEdit").Visible = canEdit;
            e.Row.FindControl("btnToggle").Visible = canEdit && id != CurrentUserId;
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "EditUser" && e.CommandName != "ToggleUser") return;

            Auth.Require("SYS_NGUOIDUNG.EDIT");
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditUser")
            {
                LoadUser(id);
                return;
            }

            // ToggleUser
            if (id == CurrentUserId)
            {
                ShowMsg("Không thể tự khóa tài khoản đang đăng nhập.", false);
                return;
            }

            DataTable dt = DataConn.StoreFillDS("pro_user_toggle_active", CommandType.StoredProcedure, id);
            if (dt.Rows[0]["RESULT"].ToString() == "NOADMIN")
            {
                ShowMsg("Hệ thống phải còn ít nhất 1 tài khoản ADMIN đang hoạt động.", false);
                return;
            }

            BindUsers();
            if (hfUserId.Value == id.ToString()) LoadUser(id);
            ShowMsg(dt.Rows[0]["U_ACTIVE"].ToString() == "Y" ? "Đã mở khóa tài khoản." : "Đã khóa tài khoản.", true);
        }

        

        // CheckBoxList không render value của checkbox ra HTML,
        // nên gắn ROLE_ID vào data-roleid để JavaScript đọc được.
        // Gắn ở PreRender vì attribute không được lưu trong ViewState.
        protected void Page_PreRender(object sender, EventArgs e)
        {
            foreach (ListItem li in cblRoles.Items)
                li.Attributes["data-roleid"] = li.Value;
        }

        [WebMethod(EnableSession = true)]
        public static object SaveUser(int id, string userName, string password,
                                      string fullName, string email, bool active, string roleIds)
        {
            try
            {
                var session = HttpContext.Current.Session;
                if (session == null || session["userid"] == null)
                    return new { ok = false, msg = "Phiên đăng nhập đã hết, vui lòng đăng nhập lại.", id = 0 };

                string need = id == 0 ? "SYS_NGUOIDUNG.ADD" : "SYS_NGUOIDUNG.EDIT";
                if (!Auth.Has(need))
                    return new { ok = false, msg = "Bạn không có quyền: " + need, id = 0 };

                int currentUserId = Convert.ToInt32(session["userid"]);

                userName = (userName ?? "").Trim();
                password = password ?? "";
                fullName = (fullName ?? "").Trim();
                email = (email ?? "").Trim();
                if (id == currentUserId) active = true;                 // không tự khóa mình

                // Chỉ nhận các ROLE_ID là số
                int tmp;
                string cleanRoleIds = string.Join(",", (roleIds ?? "")
                    .Split(',')
                    .Select(s => s.Trim())
                    .Where(s => int.TryParse(s, out tmp)));

                if (userName.Length == 0)
                    return new { ok = false, msg = "Vui lòng nhập tên đăng nhập.", id = 0 };
                if (id == 0 && password.Length == 0)
                    return new { ok = false, msg = "Vui lòng nhập mật khẩu cho người dùng mới.", id = 0 };
                if (cleanRoleIds.Length == 0)
                    return new { ok = false, msg = "Vui lòng chọn ít nhất 1 nhóm quyền.", id = 0 };

                DataTable dt = DataConn.StoreFillDS("pro_user_save", CommandType.StoredProcedure,
                                                    id, userName, password, fullName, email,
                                                    active ? "Y" : "N", cleanRoleIds);
                string result = dt.Rows[0]["RESULT"].ToString();

                if (result == "DUP")
                    return new { ok = false, msg = "Tên đăng nhập '" + userName + "' đã tồn tại.", id = 0 };
                if (result == "NOADMIN")
                    return new { ok = false, msg = "Hệ thống phải còn ít nhất 1 tài khoản ADMIN đang hoạt động.", id = 0 };

                int savedId = Convert.ToInt32(dt.Rows[0]["U_ID"]);
                if (savedId == currentUserId) Auth.LoadPermissions(savedId);   // sửa chính mình thì nạp lại quyền

                return new { ok = true, msg = "", id = savedId };
            }
            catch (Exception ex)
            {
                return new { ok = false, msg = "Lỗi: " + ex.Message, id = 0 };
            }
        }

        private void ShowMsg(string text, bool ok)
        {
            pnlMsg.Visible = true;
            pnlMsg.CssClass = ok ? "alert alert-success" : "alert alert-danger";
            litMsg.Text = HttpUtility.HtmlEncode(text);
        }
    }
}
