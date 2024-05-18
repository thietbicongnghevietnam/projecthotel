using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.App_Code;
using System.Data;

namespace WebApplication1.TemplateReport
{
    public partial class banhangtheogio : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_report = new DataTable();
        public string tungay = "";
        public string denngay = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //dt_report = DataConn.StoreFillDS("history_borrow_return_ISD", System.Data.CommandType.StoredProcedure);
                if (Request.QueryString["tungay"] is null || Request.QueryString["denngay"] is null)
                {
                    DateTime ngayHienTai = DateTime.Today;
                    string chuoiNgay = ngayHienTai.ToString("dd-MM-yyyy");
                    dt_report = DataConn.StoreFillDS("NH_BaocaoBH", System.Data.CommandType.StoredProcedure);
                    tungay = chuoiNgay;
                    denngay = chuoiNgay;
                }
                else
                {
                    string _fromdate = Request.QueryString["tungay"].Replace("'", "");
                    string _todate = Request.QueryString["denngay"].Replace("'", "");
                    tungay = _fromdate;
                    denngay = _todate;

                    //dt_report = DataConn.StoreFillDS("NH_BaocaoBH_theongay", System.Data.CommandType.StoredProcedure, _fromdate, _todate);
                    dt_report = DataConn.StoreFillDS("NH_BaocaoBH_theogio", System.Data.CommandType.StoredProcedure, _fromdate, _todate);
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "search_material2();", true);
                }
            }
        }
    }
}