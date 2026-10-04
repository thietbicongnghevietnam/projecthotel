using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class SiteMaster : MasterPage
    {
        public string Role_ = "";

        // MỚI: dùng trong Site.Master để ẩn/hiện menu (không phân biệt hoa/thường)
        public bool IsAdmin
        {
            get { return string.Equals(Role_, "admin", StringComparison.OrdinalIgnoreCase); }
        }

        public bool IsNV
        {
            get { return string.Equals(Role_, "NV", StringComparison.OrdinalIgnoreCase); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // SỬA: thiếu username hoặc thiếu role đều coi là chưa đăng nhập
            if (Session["username"] == null || Session["role"] == null)
            {
                Response.Redirect("~/Accounts/Loginnew.aspx");
            }
            else
            {
                Role_ = Session["role"].ToString().Trim();
            }

        }

        // MỚI: gọi ở dòng đầu Page_Load của các trang chỉ dành cho admin:
        //      SiteMaster.ChiChoAdmin(this);
        // Chưa đăng nhập -> về trang đăng nhập. Không phải admin -> về Default.aspx.
        public static void ChiChoAdmin(Page page)
        {
            object username = page.Session["username"];
            object role = page.Session["role"];

            if (username == null || role == null)
            {
                page.Response.Redirect("~/Accounts/Loginnew.aspx");
                return;
            }

            if (!string.Equals(role.ToString().Trim(), "admin", StringComparison.OrdinalIgnoreCase))
            {
                page.Response.Redirect("~/Default.aspx");
                return;
            }
        }

        public void bttLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();


        }


    }
}
