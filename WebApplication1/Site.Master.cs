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
        public string Role_;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((string)Session["username"] == null && (string)Session["password"] == null)
            {
                Response.Redirect("~/Accounts/Loginnew.aspx");
            }
            else
            {
                Role_ = Session["role"].ToString();
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