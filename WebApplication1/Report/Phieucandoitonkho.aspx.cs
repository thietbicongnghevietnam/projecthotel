using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebApplication1.App_Code;
using System.Web.Services;
using Newtonsoft.Json.Linq;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Text;
using System.IO;
using System.Data;

namespace WebApplication1.Report
{
    public partial class Phieucandoitonkho : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_hanghoa = new DataTable();
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt_hanghoa = DataConn.StoreFillDS("NH_danhmuchanghoa", System.Data.CommandType.StoredProcedure);                              
            }
        }

        public void updatehanghoa(object sender, EventArgs e)
        {
            string mahang = txtmahang.Text;
            string tenhang = txttenhang.Text;
            string slcu = txtslcu.Text;
            string slmoi = txtslmoi.Text;
            string userid = Session["username"].ToString();

            DataTable dtupdate = new DataTable();
            dtupdate = DataConn.StoreFillDS("NH_Update_tonkho", System.Data.CommandType.StoredProcedure, mahang, tenhang, slcu, slmoi,userid);
            if (dtupdate.Rows[0][0].ToString() == "1")
            {
                dt_hanghoa = DataConn.StoreFillDS("NH_danhmuchanghoa", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, kiểm tra lại thông tin!'); ", true);
            }

        }



    }
}