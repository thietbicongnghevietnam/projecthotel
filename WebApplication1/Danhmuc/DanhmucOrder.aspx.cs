using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using WebApplication1.App_Code;
using System.Web.Services;
using Newtonsoft.Json.Linq;
using System.Web.Script.Serialization;

namespace WebApplication1.Danhmuc
{
    public partial class DanhmucOrder : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_order = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt_order = DataConn.StoreFillDS("NH_danhmucorder", System.Data.CommandType.StoredProcedure);
            }
        }

        public void xoaorder(object sender, EventArgs e)
        {
            string tenhangid = txttenhang.Text;
            string tenbanid = txttenban.Text;


            DataTable dtupdate = new DataTable();
            dtupdate = DataConn.StoreFillDS("NH_delete_order", System.Data.CommandType.StoredProcedure, tenhangid, tenbanid);
            if (dtupdate.Rows[0][0].ToString() == "1")
            {
                dt_order = DataConn.StoreFillDS("NH_danhmucorder", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, kiểm tra lại thông tin!'); ", true);
            }

        }



    }
}