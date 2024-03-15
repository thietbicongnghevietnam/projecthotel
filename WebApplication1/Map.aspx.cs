using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using WebApplication1.App_Code;


using System.Drawing;
using System.Linq;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace WebApplication1
{
    public partial class Map : System.Web.UI.Page
    {
        public DataTable dt_doc = new DataTable();
        public DataTable dt_nhomhang = new DataTable();
        public DataTable dt_listhanghoa = new DataTable();


        public static string source;

        protected void Page_Load(object sender, EventArgs e)
        {
            dt_nhomhang = DataConn.StoreFillDS("NH_select_nhomhang", CommandType.StoredProcedure);
            
            string nhomhangid = Request.QueryString["nhomhangid"];
            if (nhomhangid != null)
            {
                dt_listhanghoa = DataConn.StoreFillDS("NH_select_hanghoa", CommandType.StoredProcedure,nhomhangid);
            }
            else
            {
                //all nhom hang
                string _nhomhangid = "";
                dt_listhanghoa = DataConn.StoreFillDS("NH_select_hanghoa", CommandType.StoredProcedure, _nhomhangid);
            }

            //if (Request.QueryString["documentNo"] != null)
            //{
            //    object[] obj = new object[] { Request.QueryString["documentNo"] };
            //    dt_doc = DataConn.StoreFillDS("NH_select_documentNo", CommandType.StoredProcedure, obj);
            //    if (dt_doc.Rows.Count > 0)
            //    {
            //        if (dt_doc.Rows[0][1] != null)
            //        {
            //            txt_doc.Text = dt_doc.Rows[0][2].ToString();
            //            txt_doc.ReadOnly = true;
            //            //txt_barcode.Focus();
            //        }
            //    }
            //    else
            //    {
            //        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.warning('Hãy kiểm tra lại thông tin. </br>Phiếu này đã nhận xong hoặc không tồn tại','Lỗi'); ", true);
            //    }
            //}

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
        public static string addthongtinhanghoa(string tenphong , string tienhang, string items)  //string tenphong, string tienhang
        {
            String thongbao = "";
            DataTable dtsave = new DataTable();

            //check xem hoa don ton tai chua
            //update *** neu hoa don ton tai roi
            //lay so hoa don truyen len de update
           
            dtsave = DataConn.StoreFillDS("NH_save_thongtinhanghoa", System.Data.CommandType.StoredProcedure,tenphong,tienhang,items);//tenphong, data, tienhang

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

        [WebMethod]
        public static string khthantoan(string tenphong,string tongtienhang, string tienno, string tienck, string items)  //string tenphong, string tienhang  --, 
        {
            String thongbao = "";
            DataTable dtsave = new DataTable();
            dtsave = DataConn.StoreFillDS("NH_save_khthanhtoan", System.Data.CommandType.StoredProcedure, tenphong, tongtienhang, tienno, tienck, items);//, 

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

        [WebMethod]
        public static string thongtinhanghoa(string tenphong)  //string tenphong, string tienhang
        {            
            //check xem hoa don ton tai chua
            //update *** neu hoa don ton tai roi
            //lay so hoa don truyen len de update            
            DataTable dt = new DataTable();

            dt = DataConn.StoreFillDS("NH_infor_thongtinhanghoa", System.Data.CommandType.StoredProcedure, tenphong);

            DataTable dt2 = new DataTable();
            dt2 = dt.Copy();

            String daresult = null;
            DataSet ds = new DataSet();
            ds.Tables.Add(dt2);
            daresult = DataSetToJSON(ds);
            return daresult;

        }


    }
}