using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

using Newtonsoft.Json;

namespace WebApplication1
{
    public partial class konvatest2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        [WebMethod]
        public static string SaveLine(float StartX, float StartY, float EndX, float EndY, int id)
                {
                    try
                    {
                        // Lưu dữ liệu vào cơ sở dữ liệu
                        using (var connection = new SqlConnection(App_Code.DataConn.source))
                        {
                            connection.Open();
                            var query = "UPDATE DM_Lines SET StartX = @StartX, StartY = @StartY, EndX = @EndX, EndY = @EndY WHERE id = @id";
                            using (var cmd = new SqlCommand(query, connection))
                            {
                                cmd.Parameters.AddWithValue("@StartX", StartX);
                                cmd.Parameters.AddWithValue("@StartY", StartY);
                                cmd.Parameters.AddWithValue("@EndX", EndX);
                                cmd.Parameters.AddWithValue("@EndY", EndY);
                                cmd.Parameters.AddWithValue("@id", id);
                                //cmd.ExecuteNonQuery();

                                int rowsAffected = cmd.ExecuteNonQuery();
                                return rowsAffected > 0 ? "Cập nhật thành công" : "Không tìm thấy bản ghi";
                            }
                        }
                        //return "{\"status\":\"success\"}";
                    }
                    catch (Exception ex)
                    {
                        return "{\"status\":\"error\",\"message\":\"" + ex.Message + "\"}";
                    }
                }
      

        public string Gettitle()
        {
            //string connectionString = "YourConnectionStringHere"; // Thay bằng chuỗi kết nối của bạn
            DataTable dt = new DataTable();

            using (var connection = new SqlConnection(App_Code.DataConn.source))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT ID,Name,X,Y,Width,Height,Color,StatusCheck FROM Warehouses where GroupName='title'", connection);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            // Chuyển DataTable thành JSON
            //JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
            //return jsSerializer.Serialize(dt);
            return JsonConvert.SerializeObject(dt);
        }

        public string GetWarehouses()
        {
            //string connectionString = "YourConnectionStringHere"; // Thay bằng chuỗi kết nối của bạn
            DataTable dt = new DataTable();           

            using (var connection = new SqlConnection(App_Code.DataConn.source))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT ID,Name,X,Y,Width,Height,Color,StatusCheck FROM Warehouses where GroupName='CN1'", connection);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            // Chuyển DataTable thành JSON
            //JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
            //return jsSerializer.Serialize(dt);
            return JsonConvert.SerializeObject(dt);
        }
        public string getkhuvuc2()
        {
            //string connectionString = "YourConnectionStringHere"; // Thay bằng chuỗi kết nối của bạn
            DataTable dt2 = new DataTable();

            using (var connection = new SqlConnection(App_Code.DataConn.source))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT ID,Name,X,Y,Width,Height,Color,StatusCheck FROM Warehouses where GroupName='CN2'", connection);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt2);
            }           
            return JsonConvert.SerializeObject(dt2);
        }

        // Hàm để lấy dữ liệu đường kẻ từ cơ sở dữ liệu       
        public string GetLinesData()
        {
            var lines = new List<Line>();
            //string connectionString = "YourConnectionString"; // Thay đổi chuỗi kết nối

            using (var connection = new SqlConnection(App_Code.DataConn.source))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT StartX, StartY, EndX, EndY,id FROM DM_Lines", connection);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        lines.Add(new Line
                        {
                            //id = reader.GetInt32(0),
                            StartX = reader.GetDouble(0),
                            StartY = reader.GetDouble(1),
                            EndX = reader.GetDouble(2),
                            EndY = reader.GetDouble(3),
                            id = reader.GetInt32(4)
                        });
                    }
                }
            }

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(lines);
        }

        [WebMethod]
        public static string UpdateWarehouse(int id, float x, float y)
        {
            //string connectionString = "YourConnectionStringHere"; // Thay bằng chuỗi kết nối của bạn

            using (var connection = new SqlConnection(App_Code.DataConn.source))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Warehouses SET X = @X, Y = @Y WHERE ID = @ID", connection);
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.Parameters.AddWithValue("@X", x);
                cmd.Parameters.AddWithValue("@Y", y);

                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0 ? "Cập nhật thành công" : "Không tìm thấy bản ghi";
            }
        }

        public string Getimage()
        {           
            DataTable dt = new DataTable();

            using (var connection = new SqlConnection(App_Code.DataConn.source))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT ID, src, X, Y FROM Warehouses where GroupName='anh'", connection);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            // Chuyển DataTable thành JSON
            //JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
            //return jsSerializer.Serialize(dt);
            return JsonConvert.SerializeObject(dt);
        }


        // Class để lưu thông tin đường kẻ
        public class Line
        {
            public double StartX { get; set; }
            public double StartY { get; set; }
            public double EndX { get; set; }
            public double EndY { get; set; }
            public int id { get; set; }
        }

    }
}