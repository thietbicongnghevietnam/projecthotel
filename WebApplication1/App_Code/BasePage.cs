using System;
using System.Web.UI;

namespace WebApplication1.App_Code
{
    public class BasePage : Page
    {
        // Trang con khai báo quyền cần có để vào trang
        protected virtual string RequiredPermission { get { return null; } }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (Session["userid"] == null)
            {
                Response.Redirect("~/Accounts/Loginnew.aspx");
                return;
            }

            if (RequiredPermission != null && !Auth.Has(RequiredPermission))
            {
                Response.Redirect("~/KhongCoQuyen.aspx");
            }
        }
    }
}