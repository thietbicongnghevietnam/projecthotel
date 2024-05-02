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
    public partial class banhangtheongayhd : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_report = new DataTable();
        //public DataTable dt1 = new DataTable();
        public DataTable dtserial = new DataTable();

        public string itemid = "";
        public string serialno = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //dt_report = DataConn.StoreFillDS("history_borrow_return_ISD", System.Data.CommandType.StoredProcedure);
                if (Request.QueryString["_ngaymuon"] is null || Request.QueryString["_ngaytra"] is null)
                {
                    dt_report = DataConn.StoreFillDS("NH_BaocaoBH", System.Data.CommandType.StoredProcedure);
                    //dt_report = DataConn.StoreFillDS("NH_BaocaoBH_theongay", System.Data.CommandType.StoredProcedure, _fromdate, _todate);
                    //itemid = "";
                    //serialno = "";
                }
                else
                {
                    string _fromdate = Request.QueryString["_ngaymuon"];
                    string _todate = Request.QueryString["_ngaytra"];

                    //itemid = _itemid.Replace("'", "");
                    //dtserial = DataConn.StoreFillDS("get_serialno", System.Data.CommandType.StoredProcedure, itemid);
                    //if (dtserial.Rows.Count > 0)
                    //{
                    //    serialno = dtserial.Rows[0][0].ToString();
                    //}
                    //else
                    //{
                    //    serialno = "";
                    //}

                    //dt_report = DataConn.StoreFillDS("history_borrow_return_ISD2", System.Data.CommandType.StoredProcedure, itemid);
                    dt_report = DataConn.StoreFillDS("NH_BaocaoBH_theongay", System.Data.CommandType.StoredProcedure, _fromdate, _todate);
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "search_material2();", true);
                }
            }
        }



    }
}