using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class konvaltest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return; // Tránh xử lý trong lần tải trang đầu tiên
            if (Request.HttpMethod == "POST")
            {
                var json = new System.IO.StreamReader(Request.InputStream).ReadToEnd();
                var serializer = new JavaScriptSerializer();
                var positions = serializer.Deserialize<List<Shape>>(json);

                SavePositions(positions);
                Response.ContentType = "application/json";
                Response.Write("{\"message\":\"Positions saved successfully\"}");
                Response.End();
            }
        }

        [WebMethod]
        public static List<Shape> GetShapes()
        {
            List<Shape> shapes = new List<Shape>();

            // Thay đổi connection string theo cơ sở dữ liệu của bạn
            using (var connection = new SqlConnection(App_Code.DataConn.source))
            {
                connection.Open();
                string query = "SELECT top 6 X, Y, Fill FROM shapes order by id desc"; // Thay đổi tên bảng theo cơ sở dữ liệu của bạn
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    shapes.Add(new Shape
                    {
                        X = reader.GetFloat(0),
                        Y = reader.GetFloat(1),
                        Fill = reader.GetString(2)
                    });
                }
            }

            return shapes;
        }

        private void SavePositions(List<Shape> positions)
        {
            //String source = @"Data Source=10.92.186.30;Initial Catalog=Warehouse_BPS;User ID=sa;Password=Psnvdb2013";
            using (var connection = new SqlConnection(App_Code.DataConn.source))
            {
                connection.Open();
                foreach (var position in positions)
                {
                    var command = new SqlCommand("INSERT INTO shapes (x, y, color) VALUES (@x, @y, @color)", connection);
                    command.Parameters.AddWithValue("@x", position.X);
                    command.Parameters.AddWithValue("@y", position.Y);
                    command.Parameters.AddWithValue("@color", position.Fill);
                    command.ExecuteNonQuery();
                }
            }
        }

        public class Shape
        {
            public float X { get; set; }
            public float Y { get; set; }
            public string Fill { get; set; }
        }


    }
}