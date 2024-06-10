using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebApplication1.App_Code;

namespace WebApplication1.TemplateReport
{
    public partial class hethongbaocadong : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        [WebMethod]
        public static string thucthicaulenh(string chuoisql)
        {
            String thongbao = "";
            // Lấy câu lệnh từ textarea
            string sql = chuoisql; //txtsql.Text;
            // Tạo một kết nối mới với cơ sở dữ liệu            
            using (SqlConnection connection = new SqlConnection(GetConnectStringFromFile()))
            {
                try
                {
                    // Mở kết nối
                    connection.Open();

                    // Tạo một đối tượng SqlCommand với câu lệnh từ textarea
                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        // Thực thi câu lệnh
                        command.ExecuteNonQuery();
                        thongbao = "OK";

                        //lblConfirm.Text = "Thực hiện thành công!";
                        //Console.WriteLine("Command executed successfully.");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return thongbao;

        }

        //public void thucthicaulenh(object sender, EventArgs e)
        //{
        //    // Lấy câu lệnh từ textarea
        //    string sql = txtsql.Text;
        //    // Tạo một kết nối mới với cơ sở dữ liệu            
        //    using (SqlConnection connection = new SqlConnection(GetConnectStringFromFile()))
        //    {
        //        try
        //        {
        //            // Mở kết nối
        //            connection.Open();

        //            // Tạo một đối tượng SqlCommand với câu lệnh từ textarea
        //            using (SqlCommand command = new SqlCommand(sql, connection))
        //            {
        //                // Thực thi câu lệnh
        //                command.ExecuteNonQuery();
        //                lblConfirm.Text = "Thực hiện thành công!";
        //                //Console.WriteLine("Command executed successfully.");
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            Console.WriteLine("Error: " + ex.Message);
        //        }
        //    }
        //}




    }
}