using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

        }

        public string GetMonthData()
        {
            List<string> months = new List<string>();
            // Kết nối và truy vấn dữ liệu
            using (SqlConnection conn = new SqlConnection("Data Source=./;Initial Catalog=DataNhaHang;User ID='sa';Password=''"))
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
            using (SqlConnection conn = new SqlConnection("Data Source=./;Initial Catalog=DataNhaHang;User ID='sa';Password=''"))
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