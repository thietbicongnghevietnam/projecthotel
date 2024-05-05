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
    public partial class Baocaotonkho : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_BCTonkho = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt_BCTonkho = DataConn.StoreFillDS("NH_Baocaotonkho", System.Data.CommandType.StoredProcedure);
            }
            
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
                dt_BCTonkho = DataConn.StoreFillDS("NH_Baocaotonkho", System.Data.CommandType.StoredProcedure);
                //datepicker.Value = ngay + "-" + thang + "-" + nam;

            }
            else
            {
                //loc theo ngay
                if (_fromdate == "")
                {
                    dt_BCTonkho = DataConn.StoreFillDS("NH_Baocaotonkho", System.Data.CommandType.StoredProcedure);
                }
                else
                {                   
                    dt_BCTonkho = DataConn.StoreFillDS("NH_Baocaotonkho", System.Data.CommandType.StoredProcedure);
                    //datepicker.Value = ngay + "-" + thang + "-" + nam;
                }
            }
        }

        public void Download_Click(object sender, EventArgs e)
        {
            DataTable dt_dowload = new DataTable();            

            dt_dowload = DataConn.StoreFillDS("NH_Baocaotonkho", System.Data.CommandType.StoredProcedure);

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

        [WebMethod]
        public static string thongtinthekho(string mahang, string fromdate, string todate)  //string tenphong, string tienhang
        {
            String daresult = null;
            DataTable dtthekho = new DataTable();
            DataSet ds = new DataSet();

            DataTable dt_new = new DataTable();
            dt_new.Columns.Add("sohd", typeof(String));
            dt_new.Columns.Add("items", typeof(String));
            dt_new.Columns.Add("soluong", typeof(String));
            dt_new.Columns.Add("created", typeof(String));
            dt_new.Columns.Add("typetk", typeof(String));


            dtthekho = DataConn.StoreFillDS("NH_thongtinthekho", System.Data.CommandType.StoredProcedure, mahang, fromdate, todate);//tenphong, data, tienhang

            string searchTerm = mahang;
            for (int i = 0; i < dtthekho.Rows.Count; i++)
            {
                string sohoadon = dtthekho.Rows[i][0].ToString();
                string jsonString = dtthekho.Rows[i][1].ToString();
                string ngaytao = dtthekho.Rows[i][2].ToString();
                string loaihoadon = dtthekho.Rows[i][3].ToString();

                if (jsonString == "{}" || jsonString is null || jsonString == "")
                {
                    //no thing  ==> truong hop nha nghi hoac karaoke khong lay do
                }
                else
                {
                    // Phân tích chuỗi JSON
                    JObject json = JObject.Parse(jsonString);

                    JToken quantity = 0;


                    // Kiểm tra xem phần tử tồn tại trong danh sách không
                    bool exists = json.Properties().Any(p => p.Name.Contains(searchTerm));
                    if (exists)
                    {
                        foreach (var item in json)
                        {
                            //string key = item.Key;
                            if (item.Key == searchTerm)
                            {
                                JToken value = item.Value;
                            }
                            quantity = item.Value;
                            break;
                        }
                        //Console.WriteLine($"Phần tử '{searchTerm}' tồn tại trong danh sách.");
                        //dt_new.Rows.Add(sohoadon, jsonString, quantity, ngaytao, loaihoadon);
                        dt_new.Rows.Add(sohoadon, mahang, quantity, ngaytao, loaihoadon);
                    }
                    else
                    {
                        //Console.WriteLine($"Phần tử '{searchTerm}' không tồn tại trong danh sách.");
                        //nothing
                    }
                }                
            }

            DataTable dt2 = new DataTable();
            dt2 = dt_new.Copy();

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