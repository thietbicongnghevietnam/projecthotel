﻿using System;
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
    public partial class BaocaoBHtheogio : System.Web.UI.Page
    {
        public DataTable dtbaocaobanhang = new DataTable();
        public DataTable dt_getSohd = new DataTable();
        public string sohoadon = "";

        public string giovao = "00";
        public string phutvao = "00";
        public string giora = "00";
        public string phutra = "00";
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
            string tungay = Date2.Value;// Request.Form[txtngaymuon.UniqueID];//txtngaymuon.Text.ToString();
            string denngay = ngaychiid.Value;// Request.Form[txtngaytra.UniqueID];// txtngaytra.Text.ToString();

            giovao = Request.Form[fromhours.UniqueID];
            phutvao = Request.Form[fromminutes.UniqueID];
            giora = Request.Form[tohours.UniqueID];
            phutra = Request.Form[tominutes.UniqueID];

            if (Int32.Parse(giovao) < 10)
            {
                giovao = "0" + giovao;
            }
            if (Int32.Parse(phutvao) < 10)
            {
                phutvao = "0" + phutvao;
            }
            if (Int32.Parse(giora) < 10)
            {
                giora = "0" + giora;
            }
            if (Int32.Parse(phutra) < 10)
            {
                phutra = "0" + phutra;
            }

            string checkin = tungay + " " + giovao + ":" + phutvao + ":" + "00";
            string checkout = denngay + " " + giora + ":" + phutra + ":" + "00";

            //Response.Redirect("ReportBorrowReturn.aspx?itemid='" + _itemid + "' ");
            Response.Redirect("/TemplateReport/banhangtheogio.aspx?tungay='" + checkin + "'&denngay='" + checkout + "' ");
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

            giovao = Request.Form[fromhours.UniqueID];
            phutvao = Request.Form[fromminutes.UniqueID];
            giora = Request.Form[tohours.UniqueID];
            phutra = Request.Form[tominutes.UniqueID];

            if (Int32.Parse(giovao) < 10)
            {
                giovao = "0" + giovao;
            }
            if (Int32.Parse(phutvao) < 10)
            {
                phutvao = "0" + phutvao;
            }
            if (Int32.Parse(giora) < 10)
            {
                giora = "0" + giora;
            }
            if (Int32.Parse(phutra) < 10)
            {
                phutra = "0" + phutra;
            }

            string checkin = _fromdate + " " + giovao + ":" + phutvao + ":" + "00";
            string checkout = _todate + " " + giora + ":" + phutra + ":" + "00";

            string _checkpartno = Request.Form["check_partno_search"];            

            if (_checkpartno == "on")
            {
                //loc theo gio o day
                //string nam = _date.Substring(6, 4);
                //string thang = _date.Substring(3, 2);
                //string ngay = _date.Substring(0, 2);
                //string _date2 = nam + "-" + thang + "-" + ngay;

                dtbaocaobanhang = DataConn.StoreFillDS("NH_BaocaoBH_theogio", System.Data.CommandType.StoredProcedure, checkin, checkout);
                //ngaychiid.Value = ngay + "-" + thang + "-" + nam;
                
                //fromhours.Value = giovao;
                //fromminutes.Value = phutvao;
                //tohours.Value = giora;
                //tominutes.Value = phutra;


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
            DataTable dt_new = new DataTable();
            dt_new.Columns.Add("tenhang", typeof(String));
            dt_new.Columns.Add("soluong", typeof(String));
            dt_new.Columns.Add("dongia", typeof(String));
            dt_new.Columns.Add("chietkhau", typeof(String));
            dt_new.Columns.Add("thanhtien", typeof(String));

            dt_new.Columns.Add("khachthanhtoan", typeof(String));
            dt_new.Columns.Add("psco", typeof(String));
            dt_new.Columns.Add("ngaytao", typeof(String));
            dt_new.Columns.Add("sohodon", typeof(String));

            dt = DataConn.StoreFillDS("NH_infor_thongtincongnoKH", System.Data.CommandType.StoredProcedure, idhoadon, _fromdate, _todate);

            if (dt.Rows[0][0].ToString() == "0")
            {
                //truong hop nha hang va hotel , hoa don chua duoc thanh toan Flag =0 
                String daresult = null;
                return daresult;
            }
            else
            {
                string items = dt.Rows[0][0].ToString();

                JavaScriptSerializer jss = new JavaScriptSerializer();
                var jsonObj = jss.Deserialize<dynamic>(items);

                foreach (var item in jsonObj)
                {
                    string[] numbersArray = item.Key.Split(',');
                    var mahang = numbersArray.FirstOrDefault();
                    //string[] strArray = mahang.Split(',');
                    var mahang1 = numbersArray[0];
                    var dongia1 = numbersArray[1];
                    var thanhtien1 = numbersArray[2];

                    var soluong = item.Value;

                    dt_new.Rows.Add(mahang, soluong, dongia1, "", thanhtien1, "", "", "", "");
                }
                string chietkhau = dt.Rows[0]["chietkhau"].ToString();
                string tongtien = dt.Rows[0]["tienhang"].ToString();
                string khachthanhtoan = "0";// dt.Rows[0]["tiensauchietkhau"].ToString();
                string khachno = "0"; //dt.Rows[0]["psco"].ToString();
                string ngaytao = dt.Rows[0]["created"].ToString();
                string hoadonid = dt.Rows[0]["sohoadon2"].ToString();
                dt_new.Rows.Add("", "", "", chietkhau, tongtien, khachthanhtoan, khachno, ngaytao, hoadonid);

                DataTable dt2 = new DataTable();
                //dt2 = dt.Copy();
                dt2 = dt_new.Copy();

                String daresult = null;
                DataSet ds = new DataSet();
                ds.Tables.Add(dt2);
                daresult = DataSetToJSON(ds);
                return daresult;
            }


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

        public void Download_Click(object sender, EventArgs e)
        {
            DataTable dt_dowload = new DataTable();
            string _fromdate = Request.Form[Date2.UniqueID];
            string _todate = Request.Form[ngaychiid.UniqueID];

            dt_dowload = DataConn.StoreFillDS("NH_BaocaoBH_theongay", System.Data.CommandType.StoredProcedure, _fromdate, _todate);


            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Baocao_banhangtheongay.xls");
            Response.Charset = "";
            Response.ContentType = "application/ms-excel";

            //System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            //response.Clear();
            //response.Buffer = true;
            //response.Charset = "";
            //response.ContentType = "text/csv";
            //response.AddHeader("Content-Disposition", "attachment;filename=myfilename.csv");

            if (dt_dowload != null)
            {
                foreach (DataColumn dc in dt_dowload.Columns)
                {
                    Response.Write(dc.ColumnName + "\t");

                }
                Response.Write(System.Environment.NewLine);
                foreach (DataRow dr in dt_dowload.Rows)
                {
                    for (int i = 0; i < dt_dowload.Columns.Count; i++)
                    {
                        Response.Write(dr[i].ToString() + "\t");
                    }
                    Response.Write("\n");
                }
            }
            Response.End();  //must this sentence
        }

    }
}