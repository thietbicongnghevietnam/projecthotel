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
    public partial class Baocaololai : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_BCTonkho = new DataTable();
        public DataTable dt_items = new DataTable();
        DataTable dt_new = new DataTable();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt_BCTonkho = DataConn.StoreFillDS("NH_Baocaotonkho_lolai", System.Data.CommandType.StoredProcedure);
                //dt_new.Columns.Add("mahang", typeof(String));
                //dt_new.Columns.Add("tenhang", typeof(String));
                //dt_new.Columns.Add("dvt", typeof(String));
                //dt_new.Columns.Add("soluongxuat", typeof(int));
                //dt_new.Columns.Add("giaban", typeof(int));
                //dt_new.Columns.Add("doanhso", typeof(int));
                //dt_new.Columns.Add("giavon", typeof(int));
                //dt_new.Columns.Add("laigop", typeof(int));
                //dt_new.Rows.Add("", "", "", 0, 0, 0, 0, 0);
            }
        }

        protected void Search_Date_Click(object sender, EventArgs e)
        {
            //string _date = Request.Form[datepicker.UniqueID];
            string _fromdate = Request.Form[Date1.UniqueID];
            string _todate = Request.Form[ngaychiid.UniqueID];

            dt_new.Columns.Add("mahang", typeof(String));
            dt_new.Columns.Add("tenhang", typeof(String));
            dt_new.Columns.Add("dvt", typeof(String));
            dt_new.Columns.Add("soluongxuat", typeof(int));
            dt_new.Columns.Add("giaban", typeof(int));
            dt_new.Columns.Add("doanhso", typeof(int));
            dt_new.Columns.Add("giavon", typeof(int));
            dt_new.Columns.Add("laigop", typeof(int));

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

                //dt_BCTonkho = DataConn.StoreFillDS("NH_Baocaotonkho_lolai", System.Data.CommandType.StoredProcedure);
                dt_new.Rows.Add("", "", "", 0, 0, 0, 0, 0);

            }
            else
            {
                //loc theo ngay
                if (_fromdate == "")
                {
                    //dt_BCTonkho = DataConn.StoreFillDS("NH_Baocaotonkho_lolai", System.Data.CommandType.StoredProcedure);
                    dt_new.Rows.Add("", "", "", 0, 0, 0, 0, 0);
                }
                else
                {                                        
                    DataTable dt_danhsachhh = new DataTable();
                    dt_danhsachhh = DataConn.StoreFillDS("NH_Baocaotonkho_lolai", System.Data.CommandType.StoredProcedure);
                    dt_items = DataConn.StoreFillDS("NH_Baocaotonkho_lolai2", System.Data.CommandType.StoredProcedure, _fromdate, _todate);

                    int _soluongxuat = 0;
                    int _doanhso = 0;
                    int _tonggiavon = 0;
                    int _laigop = 0;

                    for (int i = 0; i < dt_danhsachhh.Rows.Count; i++)
                    {
                        string mahang = dt_danhsachhh.Rows[i]["mahang"].ToString();
                        string tenhang = dt_danhsachhh.Rows[i]["tenhang"].ToString();
                        string dvt = dt_danhsachhh.Rows[i]["dvt"].ToString();
                        string giaban = dt_danhsachhh.Rows[i]["giaban"].ToString();
                        string giavon = dt_danhsachhh.Rows[i]["gianhap"].ToString();

                        int soluongxuat = 0;
                        int doanhso = 0;
                        int tonggiavon = 0;
                        int laigop = 0;

                       
                        for (int j = 0; j < dt_items.Rows.Count; j++)
                        {                           
                            string jsonString = dt_items.Rows[j][0].ToString();                           

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
                                bool exists = json.Properties().Any(p => p.Name.Contains(mahang));
                                if (exists)
                                {
                                    foreach (var item in json)
                                    {
                                        //string key = item.Key;
                                        if (item.Key == mahang)
                                        {
                                            JToken value = item.Value;
                                        }
                                        quantity = item.Value;
                                        break;
                                    }
                                    soluongxuat = soluongxuat + Convert.ToInt32(quantity);
                                    doanhso = soluongxuat * Int32.Parse(giaban);
                                    tonggiavon = soluongxuat * Int32.Parse(giavon);
                                    laigop = doanhso - tonggiavon;

                                    //Console.WriteLine($"Phần tử '{searchTerm}' tồn tại trong danh sách.");
                                    //dt_new.Rows.Add(sohoadon, jsonString, quantity, ngaytao, loaihoadon);
                                    dt_new.Rows.Add(mahang,tenhang,dvt, soluongxuat, giaban, doanhso, tonggiavon, laigop);

                                    _soluongxuat = _soluongxuat + soluongxuat;
                                    _doanhso = _doanhso + doanhso;
                                    _tonggiavon = _tonggiavon + tonggiavon;
                                    _laigop = _laigop + laigop;
                                }
                                else
                                {
                                    //Console.WriteLine($"Phần tử '{searchTerm}' không tồn tại trong danh sách.");
                                    //nothing
                                }
                            }
                            
                        }                        
                    }


                    dt_new.Rows.Add("", "", "", _soluongxuat, 0, _doanhso, _tonggiavon, _laigop);

                   


                    dt_BCTonkho = dt_new.Copy();
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




    }
}