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
            source = @"Data Source=./;Initial Catalog=DataNhaHang;User ID='sa';Password=''";

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