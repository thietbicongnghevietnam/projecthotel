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
    public partial class BaocaotonghopNH : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_banhang = new DataTable();

        public class Item
        {
            public string tenhang { get; set; }
            public int sloluong { get; set; }
            public int dongia { get; set; }
            public int thanhtien { get; set; }
            // Các thông tin khác của mặt hàng có thể được thêm vào đây
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loaddata();

            }
        }

        void loaddata()
        {
            DataTable dt_new = new DataTable();
            //dt_new.Columns.Add("mahang", typeof(String));
            dt_new.Columns.Add("tenhang", typeof(String));
            dt_new.Columns.Add("sloluong", typeof(String));
            dt_new.Columns.Add("dongia", typeof(String));
            dt_new.Columns.Add("thanhtien", typeof(String));

            DataTable dt_items = new DataTable();

            int tongdoanhthu = 0;

            string fromdate = Request.Form[Date1.UniqueID];
            string todate = Request.Form[ngaychiid.UniqueID];

            if (fromdate == "" || todate == "" || fromdate is null || todate is null)
            {
                dt_items = DataConn.StoreFillDS("NH_BC_tonghopNH", System.Data.CommandType.StoredProcedure);
            }
            else
            {
                //loc theo ngay
                dt_items = DataConn.StoreFillDS("NH_BC_tonghopNH_theongay", System.Data.CommandType.StoredProcedure, fromdate, todate);
            }

            // Tạo Dictionary để lưu trữ tổng số lượng của từng tên mặt hàng
            Dictionary<string, Item> itemsInfo = new Dictionary<string, Item>();

            if (dt_items.Rows.Count > 0)
            {
                for (int i = 0; i < dt_items.Rows.Count; i++)
                {
                    JObject jsonObject = JObject.Parse(dt_items.Rows[i][0].ToString());
                    foreach (var kvp in jsonObject)
                    {
                        string itemName = kvp.Key.Split(',')[0].Trim();
                        string dongia_ = kvp.Key.Split(',')[1].Trim();
                        string thanhtien_ = kvp.Key.Split(',')[2].Trim();
                        int quantity = (int)kvp.Value;

                        // Cập nhật hoặc thêm số lượng vào Dictionary
                        if (itemsInfo.ContainsKey(itemName))
                        {
                            itemsInfo[itemName].sloluong += quantity;
                        }
                        else
                        {
                            // Nếu không, thêm mặt hàng mới vào Dictionary
                            itemsInfo[itemName] = new Item { tenhang = itemName, sloluong = quantity, dongia = Int32.Parse(dongia_), thanhtien = Int32.Parse(thanhtien_) };
                        }

                    }
                }

                // Thêm từng cặp key-value từ Dictionary vào DataTable
                foreach (var kvp in itemsInfo)
                {
                    tongdoanhthu = tongdoanhthu + (kvp.Value.sloluong * kvp.Value.dongia);
                    dt_new.Rows.Add(kvp.Value.tenhang, kvp.Value.sloluong, kvp.Value.dongia, kvp.Value.sloluong * kvp.Value.dongia);
                }
                dt_new.Rows.Add("-", "-", "Total", tongdoanhthu);

                //show bao cao ton kho
                dt_banhang = dt_new.Copy();
            }
            else
            {
                dt_new.Rows.Add("", "", "", "0");
                dt_banhang = dt_new.Copy();
            }
        }

        protected void Search_Date_Click(object sender, EventArgs e)
        {
            loaddata();
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


            dtthekho = DataConn.StoreFillDS("NH_thongtinthekho_NH", System.Data.CommandType.StoredProcedure, mahang, fromdate, todate);//tenphong, data, tienhang

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
                            if (item.Key.Split(',')[0] == searchTerm)
                            {
                                JToken value = item.Value;
                                quantity = item.Value;
                                break;
                            }
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