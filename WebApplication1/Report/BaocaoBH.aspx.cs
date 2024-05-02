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

namespace WebApplication1.Report
{
    public partial class BaocaoBH : System.Web.UI.Page
    {
        public DataTable dtbaocaobanhang = new DataTable();
        public DataTable dt_getSohd = new DataTable();
        public string sohoadon = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dtbaocaobanhang = DataConn.StoreFillDS("NH_BaocaoBH", System.Data.CommandType.StoredProcedure);

                dt_getSohd = DataConn.StoreFillDS("NH_getsohoadon_BH", System.Data.CommandType.StoredProcedure);
                sohoadon = dt_getSohd.Rows[0][0].ToString();
            }               
        }

        public void Download_Click2(object sender, EventArgs e)
        {
            //string _itemid = itemid.Value.ToString();
            string _ngaymuon = Request.Form[txtngaymuon.UniqueID];//txtngaymuon.Text.ToString();
            string _ngaytra = Request.Form[txtngaytra.UniqueID];// txtngaytra.Text.ToString();

            //Response.Redirect("ReportBorrowReturn.aspx?itemid='" + _itemid + "' ");
            Response.Redirect("/TemplateReport/banhangtheongayhd.aspx?_ngaymuon='" + _ngaymuon + "'&_ngaytra='" + _ngaytra + "' ");
        }

        public void BtnOrderItem(object sender, EventArgs e)
        {
            string userid = txtuserid.Text.ToString();
            string _sohd = txtsohoadon.Text.ToString();
            string _ngaymuon = Request.Form[txtngaymuon.UniqueID];//txtngaymuon.Text.ToString();
            string _ngaytra = Request.Form[txtngaytra.UniqueID];// txtngaytra.Text.ToString();

            DataTable dt5 = new DataTable();
            DataTable dtuser = new DataTable();
            if (userid == "")
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, user does not input infor!'); ", true);
            }
            else
            {
            }
        }

        protected void Search_Date_Click2(object sender, EventArgs e)
        {
            string _fromdate = Request.Form[Date2.UniqueID];
            string _todate = Request.Form[ngaychiid.UniqueID];
            //string _date = Request.Form[ngaychiid.UniqueID];
            string _checkpartno = Request.Form["check_partno_search"];
            string _partno = partno_search.Value.ToString();
            //filter_type.Text = "";

            if (_checkpartno == "on")
            {
                //loc theo ma
                //string nam = _date.Substring(6, 4);
                //string thang = _date.Substring(3, 2);
                //string ngay = _date.Substring(0, 2);
                //string _date2 = nam + "-" + thang + "-" + ngay;

                dtbaocaobanhang = DataConn.StoreFillDS("NH_BaocaoBH", System.Data.CommandType.StoredProcedure);
                //ngaychiid.Value = ngay + "-" + thang + "-" + nam;

            }
            else
            {
                //loc theo ngay
                if (_fromdate == "")
                {
                    dtbaocaobanhang = DataConn.StoreFillDS("NH_BaocaoBH", System.Data.CommandType.StoredProcedure);
                }
                else
                {
                    //string nam = _date.Substring(6, 4);
                    //string thang = _date.Substring(3, 2);
                    //string ngay = _date.Substring(0, 2);
                    //string _date2 = nam + "-" + thang + "-" + ngay;

                    //string _cate = dr_filter_cate.Text;
                    //string typefilter = "all";



                    dtbaocaobanhang = DataConn.StoreFillDS("NH_BaocaoBH_theongay", System.Data.CommandType.StoredProcedure, _fromdate, _todate);
                    //ngaychiid.Value = ngay + "-" + thang + "-" + nam;
                }
            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //string ngayid = ngaychiid.Text;
        //}

        [WebMethod]
        public static string thongtinhoadon(string idhoadon, string _fromdate, string _todate)  //string tenphong, string tienhang
        {
            DataTable dt = new DataTable();

            dt = DataConn.StoreFillDS("NH_infor_thongtincongnoKH", System.Data.CommandType.StoredProcedure, idhoadon, _fromdate, _todate);

            DataTable dt2 = new DataTable();
            dt2 = dt.Copy();

            String daresult = null;
            DataSet ds = new DataSet();
            ds.Tables.Add(dt2);
            daresult = DataSetToJSON(ds);
            return daresult;
        }

        public static string DataSetToJSON(DataSet ds)
        {
            Dictionary<string, object> dict = new Dictionary<string, object>();
            foreach (DataTable dt in ds.Tables)
            {
                object[] arr = new object[dt.Rows.Count + 1];

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    arr[i] = dt.Rows[i].ItemArray;
                }

                //dict.Add(dt.TableName, arr);
                dict.Add(dt.TableName, arr);
            }

            JavaScriptSerializer json = new JavaScriptSerializer();
            return json.Serialize(dict);
        }



    }
}