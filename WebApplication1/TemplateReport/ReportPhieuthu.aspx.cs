using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using WebApplication1.App_Code;


namespace WebApplication1.TemplateReport
{
    public partial class ReportPhieuthu : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_report = new DataTable();
        public string soHD = "";
        public string nguoinoptien = "";
        public string lydo = "";
        public string sotien = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["sohoadon"] != "" )
                {
                    string _sohoadon = Request.QueryString["sohoadon"].Replace("'", "");

                    dt_report = DataConn.StoreFillDS("NH_sochungtu_PT", System.Data.CommandType.StoredProcedure, _sohoadon);
                    nguoinoptien = dt_report.Rows[0][4].ToString();
                    lydo = dt_report.Rows[0][9].ToString();
                    sotien = dt_report.Rows[0][7].ToString();

                }
            }
        }


    }
}