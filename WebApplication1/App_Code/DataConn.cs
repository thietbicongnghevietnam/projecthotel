using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using System.IO;

namespace WebApplication1.App_Code
{
    public class DataConn
    {
        public static string source;
        private static SqlConnection con;
        public static int gio;
        public static DbDataAdapter adapter;
        
        static DataConn()
        {            
            //source = @"Data Source=10.92.186.30;Initial Catalog=Warehouse_BPS;User ID=sa;Password=Psnvdb2013";

            //local
            //source = @"Data Source=./;Initial Catalog=Warehouse_BPS;User ID='sa';Password=''";
            //source = @"Data Source=./;Initial Catalog=DataNhaHang;User ID='sa';Password=''";
            source = @"Data Source=./;Initial Catalog=DataBanHang;User ID='sa';Password=''";

            con = new SqlConnection(source);
            try
            {
                con.Open();
            }
            catch
            {
            }
        }

       public static string GetConnectStringFromFile()
        {
            //string line = @"Data Source=192.168.128.1;Initial Catalog=Tally_Sheet;Persist Security Info=True;User ID=sa;Password=Psnvdb2013";
            string filePath = HttpContext.Current.Server.MapPath("~/scnn.ini");
            string line;
            try
            {
                //using (StreamReader sr = new StreamReader("scnn.ini"))
                //{
                //    line = sr.ReadToEnd();
                //}
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

        public static void OpenConnection(SqlConnection cnn)
        {

            cnn = new SqlConnection(GetConnectStringFromFile());
            cnn.Open();            
        }

        public static void CloseConnection(SqlConnection cnn)
        {
            cnn.Close();
        }

        public static DataTable DataTable_Sql(string sql)
        {
            using (SqlConnection conn = new SqlConnection(source))
            {
                using (SqlDataAdapter dap = new SqlDataAdapter(sql, conn))
                {
                    using (DataSet ds = new DataSet())
                    {
                        dap.Fill(ds);
                        conn.Close();
                        conn.Dispose();
                        return ds.Tables[0];
                    }
                }
            }
        }



        public static int Execute_NonSQL(string sql)
        {
            SqlTransaction sqltran = null;
            //try
            //{
            SqlConnection conn = new SqlConnection(source);

            int row = 0;
            conn.Open();
            sqltran = conn.BeginTransaction();
            SqlCommand cmd = new SqlCommand(sql, conn, sqltran);
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = sql;
            row = cmd.ExecuteNonQuery();
            sqltran.Commit();
            conn.Dispose();
            conn.Close();
            return row;
            //}
            //catch (Exception ex)
            //{
            //    // throw new Exception(ex.Message);
            //    sqltran.Rollback();
            //    var _ex = new Exception(ex.Message + "Chỗ này sai rồi... : '" + sql + "'");
            //    throw _ex;
            //}
        }

        public static int Execute_NonSQL2(string sql, List<SqlParameter> parameters = null)
        {
            SqlTransaction sqltran = null;
            SqlConnection conn = null;
            SqlCommand cmd = null;
            int row = 0;

            try
            {
                // Tạo kết nối mới
                conn = new SqlConnection(source);
                conn.Open();

                // Bắt đầu giao dịch
                sqltran = conn.BeginTransaction();

                // Tạo đối tượng SqlCommand
                cmd = new SqlCommand(sql, conn, sqltran);
                cmd.CommandType = CommandType.Text;

                // Nếu có tham số, thêm vào SqlCommand
                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters.ToArray());
                }

                // Thực thi câu lệnh SQL
                row = cmd.ExecuteNonQuery();

                // Commit giao dịch nếu không có lỗi
                sqltran.Commit();
            }
            catch (Exception ex)
            {
                // Nếu có lỗi, rollback giao dịch
                if (sqltran != null)
                {
                    sqltran.Rollback();
                }

                // Đảm bảo kết nối và các tài nguyên được giải phóng
                if (conn != null)
                {
                    conn.Close();
                    conn.Dispose();
                }

                // Thông báo lỗi chi tiết
                throw new Exception("Lỗi khi thực thi SQL: " + ex.Message + "\nSQL: " + sql);
            }
            finally
            {
                // Giải phóng tài nguyên
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                    conn.Dispose();
                }
                if (sqltran != null)
                {
                    sqltran.Dispose();
                }
                if (cmd != null)
                {
                    cmd.Dispose();
                }
            }

            return row;
        }

        public static DataTable StoreFillDS(string query_object, CommandType type, params object[] obj)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectStringFromFile()))
            {
                conn.Open(); // Mở kết nối trước khi thực hiện DeriveParameters

                using (SqlCommand cmd = new SqlCommand(query_object, conn))
                {
                    cmd.CommandType = type;
                    SqlCommandBuilder.DeriveParameters(cmd);

                    // Set parameter values
                    for (int i = 0; i < obj.Length; i++)
                    {
                        cmd.Parameters[i + 1].Value = obj[i];
                    }

                    // Continue with the rest of your logic
                    SqlDataAdapter dap = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    dap.Fill(ds);

                    return ds.Tables[0];
                }
            }
        }

        public static DataTable Execute_StoredProcedure(string storedProcedure, List<SqlParameter> parameters = null)
        {
            SqlConnection conn = null;
            SqlCommand cmd = null;
            SqlDataAdapter dataAdapter = null;
            DataTable resultTable = new DataTable();

            try
            {
                // Tạo kết nối mới
                conn = new SqlConnection(source);
                conn.Open();

                // Tạo SqlCommand để gọi stored procedure
                cmd = new SqlCommand(storedProcedure, conn);
                cmd.CommandType = CommandType.StoredProcedure;

                // Nếu có tham số, thêm vào SqlCommand
                if (parameters != null)
                {
                    cmd.Parameters.AddRange(parameters.ToArray());
                }

                // Tạo SqlDataAdapter để thực thi câu lệnh SQL và điền vào DataTable
                dataAdapter = new SqlDataAdapter(cmd);
                dataAdapter.Fill(resultTable);  // Điền dữ liệu vào DataTable

            }
            catch (Exception ex)
            {
                // Thông báo lỗi chi tiết nếu có lỗi xảy ra
                throw new Exception("Lỗi khi thực thi Stored Procedure: " + ex.Message + "\nStored Procedure: " + storedProcedure);
            }
            finally
            {
                // Giải phóng tài nguyên
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                    conn.Dispose();
                }
                if (cmd != null)
                {
                    cmd.Dispose();
                }
                if (dataAdapter != null)
                {
                    dataAdapter.Dispose();
                }
            }

            return resultTable;  // Trả về DataTable chứa kết quả
        }

        //public static DataTable StoreFillDS(string query_object, CommandType type, params object[] obj)
        //{
        //    //SqlConnection conn = new SqlConnection(source);
        //    //conn.Open();
        //    OpenConnection(con);

        //    SqlCommand cmd = new SqlCommand(query_object, con);
        //    cmd.CommandType = type;
        //    SqlCommandBuilder.DeriveParameters(cmd);
        //    for (int i = 1; i <= obj.Length; i++)
        //    {
        //        cmd.Parameters[i].Value = obj[i - 1];
        //    }
        //    SqlDataAdapter dap = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    dap.Fill(ds);
        //    con.Dispose();
        //    CloseConnection(con);
        //    //conn.Close();
        //    return ds.Tables[0];
        //}

        //public static DataTable StoreFillDS(string query_object, CommandType type, params object[] obj)
        //{
        //    SqlConnection conn = new SqlConnection(source);
        //    conn.Open();            

        //    SqlCommand cmd = new SqlCommand(query_object, conn);
        //    cmd.CommandType = type;
        //    SqlCommandBuilder.DeriveParameters(cmd);
        //    for (int i = 1; i <= obj.Length; i++)
        //    {
        //        cmd.Parameters[i].Value = obj[i - 1];
        //    }
        //    SqlDataAdapter dap = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    dap.Fill(ds);
        //    conn.Dispose();
        //    conn.Close();
        //    return ds.Tables[0];
        //}

        /*Nguyen Hien*/
        //Store Procedure tra ve datatable
        public static int ExecuteStore(string query_object, CommandType type, params object[] obj)
        {
            int row = 0;
            SqlConnection conn = new SqlConnection(source);
            conn.Open();
            SqlCommand cmd = new SqlCommand(query_object, conn);
            cmd.CommandType = type;
            SqlCommandBuilder.DeriveParameters(cmd);
            for (int i = 1; i <= obj.Length; i++)
            {
                cmd.Parameters[i].Value = obj[i - 1];
            }
            cmd.ExecuteNonQuery();
            conn.Dispose();
            conn.Close();
            return row;
        }

        /*Tien Chung*/
        //Store Procedure tra ve datatable


        public static DataTable FillStore(string storename, CommandType type, params object[] obj)
        {
            SqlConnection conn = new SqlConnection(source);
            conn.Open();
            SqlCommand cmd = new SqlCommand(storename, conn);
            cmd.CommandType = type;
            SqlCommandBuilder.DeriveParameters(cmd);
            for (int i = 1; i <= obj.Length; i++)
            {
                cmd.Parameters[i].Value = obj[i - 1];
            }
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            //cmd.ExecuteNonQuery();
            dap.Fill(ds);
            conn.Dispose();
            conn.Close();
            return ds.Tables[0];
        }


    }
}