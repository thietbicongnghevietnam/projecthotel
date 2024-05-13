using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using WebApplication1.App_Code;
using System.Web.Script.Serialization;

namespace WebApplication1.TemplateReport
{
    public partial class ReportPhieuthu : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_report = new DataTable();
        public string soHD = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["sohoadon"] is null )
                {
                    string _sohoadon = Request.QueryString["sohoadon"].Replace("'", "");

                    dt_report = DataConn.StoreFillDS("NH_sochungtu_PT", System.Data.CommandType.StoredProcedure, _sohoadon);

                }
            }
        }


    }
}