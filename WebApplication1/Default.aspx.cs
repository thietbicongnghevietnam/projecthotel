using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionString = "Data Source=./;Initial Catalog=DataNhaHang;User ID='sa';Password=''";
                string query = "SELECT DayName, Revenue FROM View_daily_revenue ORDER BY DayName";

                DataTable dt = new DataTable();

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                    adapter.Fill(dt);
                }

                // Chuyển đổi DataTable thành JSON và gán vào JavaScript
                string json = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
                ClientScript.RegisterStartupScript(this.GetType(), "data", $"var chartData = {json};", true);
            }
        }

        public static string GetConnectStringFromFile()
        {
            string filePath = HttpContext.Current.Server.MapPath("~/scnn.ini");
            string line;
            try
            {
                using (StreamReader sr = new StreamReader(filePath))
                {
                    line = sr.ReadToEnd();
                }
            }
            catch
            {
                line = "";
            }
            return line;
        }

        public string GetMonthData()
        {
            //source = @"Data Source=./;Initial Catalog=DataNhaHang;User ID='sa';Password=''";
            List<string> months = new List<string>();
            // Kết nối và truy vấn dữ liệu
            //using (SqlConnection conn = new SqlConnection("Data Source=./;Initial Catalog=DataNhaHang;User ID='sa';Password=''"))
            using (SqlConnection conn = new SqlConnection(GetConnectStringFromFile()))
            {
                conn.Open();
                string query = "SELECT MonthName FROM View_Doanhthutheothang"; // Thay đổi câu truy vấn theo cơ sở dữ liệu của bạn
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            months.Add("'" + reader["MonthName"].ToString() + "'");
                        }
                    }
                }
            }
            return "[" + string.Join(", ", months) + "]";
        }

        // Hàm để lấy dữ liệu doanh thu
        public string GetRevenueData()
        {
            List<string> revenues = new List<string>();
            // Kết nối và truy vấn dữ liệu
            using (SqlConnection conn = new SqlConnection(GetConnectStringFromFile()))
            {
                conn.Open();
                string query = "SELECT Revenue FROM View_Doanhthutheothang"; // Thay đổi câu truy vấn theo cơ sở dữ liệu của bạn
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            revenues.Add(reader["Revenue"].ToString());
                        }
                    }
                }
            }
            return "[" + string.Join(", ", revenues) + "]";
        }

        //[WebMethod]
        //public static List<string> GetCurrentTime(string _mahang)
        //{
        //    //source = @"Data Source=10.92.186.30;Initial Catalog=Warehouse_BPS;User ID=sa;Password=Psnvdb2013";
        //    List<string> docResult = new List<string>();

        //    return docResult;

        //}


    }
}