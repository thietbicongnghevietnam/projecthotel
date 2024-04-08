using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using WebApplication1.App_Code;


using System.Drawing;
using System.Web.Script.Serialization;

namespace WebApplication1
{    
    public partial class Phieunhaphang : System.Web.UI.Page
    {
        public DataTable dt_doc = new DataTable();
        public DataTable dt_nhomhang = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindStockCode();
            }
        }

        [WebMethod]
        public static List<string> searchmahang(string _mahang)
        {
            //source = @"Data Source=10.92.186.30;Initial Catalog=Warehouse_BPS;User ID=sa;Password=Psnvdb2013";
            List<string> docResult = new List<string>();
            using (SqlConnection con = new SqlConnection(DataConn.source))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    //cmd.CommandText = "select Top 10 t.TOOLING_NO from (select distinct DOC_NUM from TBL_GR_MCS_PLAN where DOC_NUM LIKE ''+@SearchDoc+'%' and [STATUS] <> 'Xong') t;";
                    cmd.CommandText = "select Top 10 a.mahang from [Warehouse_BPS].[dbo].[hthanghoa] a where a.mahang like '%'+@_mahang+'%' ;";
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@_mahang", _mahang);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        docResult.Add(dr["mahang"].ToString());
                    }
                    con.Close();
                    return docResult;
                }
            }
        }


    }
}