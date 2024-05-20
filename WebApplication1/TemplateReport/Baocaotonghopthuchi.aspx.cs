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
    public partial class Baocaotonghopthuchi : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_report = new DataTable();
        public DataTable dt_thuchi = new DataTable();
        public string tungay = "";
        public string denngay = "";

        public string tongthutheongay = "";
        public string tongchitheongay = "";
        public string tongdoanhsoBH = "";
        public string doanhsosauchietkhau = "";

        public string tendovi = "";
        public string diachidonvi = "";
        public string sodtdonvi = "";
        public DataTable dtdonvi = new DataTable();

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

                    dt_thuchi = DataConn.StoreFillDS("NH_Baocaothuchi_theongay", System.Data.CommandType.StoredProcedure, tungay, denngay);
                    if (dt_thuchi.Rows[0][0].ToString() == "")
                    {
                        tongthutheongay = "0";
                    }
                    else
                    {
                        tongthutheongay = dt_thuchi.Rows[0][0].ToString();
                    }

                    if (dt_thuchi.Rows[0][1].ToString() == "")
                    {
                        tongchitheongay = "0";
                    }
                    else
                    {
                        tongchitheongay = dt_thuchi.Rows[0][1].ToString();
                    }

                    if (dt_thuchi.Rows[0][2].ToString() == "")
                    {
                        tongdoanhsoBH = "0";
                    }
                    else
                    {
                        tongdoanhsoBH = dt_thuchi.Rows[0][2].ToString();
                    }
                    //tong doanh so sau phat sinh = tong doanh so ban hang + tong thu - tong chi
                    doanhsosauchietkhau = (Int32.Parse(tongdoanhsoBH) + Int32.Parse(tongthutheongay) - Int32.Parse(tongchitheongay)).ToString();


                }
                else
                {
                    string _fromdate = Request.QueryString["tungay"].Replace("'", "");
                    string _todate = Request.QueryString["denngay"].Replace("'", "");
                    tungay = _fromdate;
                    denngay = _todate;

                    dt_thuchi = DataConn.StoreFillDS("NH_Baocaothuchi_theongay", System.Data.CommandType.StoredProcedure, tungay, denngay);
                    if (dt_thuchi.Rows[0][0].ToString() == "")
                    {
                        tongthutheongay = "0";
                    }
                    else
                    {
                        tongthutheongay = dt_thuchi.Rows[0][0].ToString();
                    }

                    if (dt_thuchi.Rows[0][1].ToString() == "")
                    {
                        tongchitheongay = "0";
                    }
                    else
                    {
                        tongchitheongay = dt_thuchi.Rows[0][1].ToString();
                    }

                    if (dt_thuchi.Rows[0][2].ToString() == "")
                    {
                        tongdoanhsoBH = "0";
                    }
                    else
                    {
                        tongdoanhsoBH = dt_thuchi.Rows[0][2].ToString();
                    }
                    //tong doanh so sau phat sinh = tong doanh so ban hang + tong thu - tong chi
                    doanhsosauchietkhau = (Int32.Parse(tongdoanhsoBH) + Int32.Parse(tongthutheongay) - Int32.Parse(tongchitheongay)).ToString();

                    dt_report = DataConn.StoreFillDS("NH_BaocaoBH_theongay", System.Data.CommandType.StoredProcedure, _fromdate, _todate);
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "search_material2();", true);
                }

                dtdonvi = DataConn.StoreFillDS("NH_thongtin_doanhnghiep", System.Data.CommandType.StoredProcedure);
                tendovi = dtdonvi.Rows[0][1].ToString();
                diachidonvi = dtdonvi.Rows[0][5].ToString();
                sodtdonvi = dtdonvi.Rows[0][7].ToString();
            }
        }


    }
}