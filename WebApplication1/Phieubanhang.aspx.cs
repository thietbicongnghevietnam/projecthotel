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
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace WebApplication1
{
    public partial class Phieubanhang : System.Web.UI.Page
    {
        public DataTable dt_doc = new DataTable();
        public DataTable dt_nhomhang = new DataTable();

        public DataTable dtncc = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindStockCode();

                dtncc = DataConn.StoreFillDS("NH_Get_KH", System.Data.CommandType.StoredProcedure);
                DataRow newRow2 = dtncc.NewRow();
                newRow2["makh"] = "==KH==";
                dtncc.Rows.InsertAt(newRow2, 0);
                dr_nhacungcap.DataSource = dtncc;
                dr_nhacungcap.DataBind();


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

        [WebMethod]
        public static string getthongtinmahang(string _mahang)
        {
            DataTable dt = new DataTable();

            dt = DataConn.StoreFillDS("NH_select_documentNo", System.Data.CommandType.StoredProcedure, _mahang);

            DataTable dt2 = new DataTable();
            dt2 = dt.Copy();

            String daresult = null;
            DataSet ds = new DataSet();
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

        [WebMethod]
        public static string addthongtinhanghoa_PBH(string thanhtoantien, string psno, string chieukhau, string nhacungcap, string tienhang, string items)  //string tenphong, string tienhang
        {
            String thongbao = "";
            DataTable dtsave = new DataTable();
            DataTable dtupdatekho = new DataTable();

            JavaScriptSerializer jss = new JavaScriptSerializer();
            var jsonObj = jss.Deserialize<dynamic>(items);
            string type_act = "banhang";

            foreach (var item in jsonObj)
            {
                string[] numbersArray = item.Key.Split(',');
                var mahang = numbersArray.FirstOrDefault();
                var soluong = item.Value;
                //Console.WriteLine($"Key: {key}, Value: {value}");
                dtupdatekho = DataConn.StoreFillDS("NH_updatekho", System.Data.CommandType.StoredProcedure, mahang, soluong, type_act);
            }
            //check xem hoa don ton tai chua
            //update *** neu hoa don ton tai roi
            //lay so hoa don truyen len de update
            dtsave = DataConn.StoreFillDS("addthongtinhanghoa_PBH", System.Data.CommandType.StoredProcedure, thanhtoantien, psno, chieukhau, nhacungcap, tienhang, items);

            if (dtsave.Rows[0][0].ToString() == "1")
            {
                //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();

                thongbao = "OK";
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;
        }


    }
}