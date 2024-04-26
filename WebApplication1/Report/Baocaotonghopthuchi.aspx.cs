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

namespace WebApplication1.Report
{
    public partial class Baocaotonghopthuchi : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_soquy = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            dt_soquy = DataConn.StoreFillDS("NH_Baocaosoquy", System.Data.CommandType.StoredProcedure);

        }
        protected void Search_Date_Click(object sender, EventArgs e)
        {
            //string _date = Request.Form[datepicker.UniqueID];
            string _fromdate = Request.Form[Date1.UniqueID];
            string _todate = Request.Form[ngaychiid.UniqueID];


            //string _todate = Request.Form[ngaychiid.UniqueID];

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

                dt_soquy = DataConn.StoreFillDS("NH_Baocaosoquy", System.Data.CommandType.StoredProcedure);
                //datepicker.Value = ngay + "-" + thang + "-" + nam;

            }
            else
            {
                //loc theo ngay
                if (_fromdate == "")
                {
                    dt_soquy = DataConn.StoreFillDS("NH_Baocaosoquy", System.Data.CommandType.StoredProcedure);
                }
                else
                {
                    //string nam = _date.Substring(6, 4);
                    //string thang = _date.Substring(3, 2);
                    //string ngay = _date.Substring(0, 2);
                    //string _date2 = nam + "-" + thang + "-" + ngay;

                    ////string _cate = dr_filter_cate.Text;
                    //string typefilter = "all";
                    dt_soquy = DataConn.StoreFillDS("NH_Baocaosoquy_theongay", System.Data.CommandType.StoredProcedure, _fromdate, _todate);
                    //datepicker.Value = ngay + "-" + thang + "-" + nam;
                }
            }
        }

        public void Download_Click(object sender, EventArgs e)
        {
            DataTable dt_dowload = new DataTable();
            //if (dr_filter_cate.Text == "==select==")
            //{
            //    dt_dowload = DataConn.StoreFillDS("Get_history_device_borrow", CommandType.StoredProcedure);
            //}
            //else
            //{
            //    string _cate = dr_filter_cate.Text;
            //    dt_dowload = DataConn.StoreFillDS("Get_history_device_borrow_cate", System.Data.CommandType.StoredProcedure, _cate);
            //}


            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Baocao_lichsu_muon.xls");
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