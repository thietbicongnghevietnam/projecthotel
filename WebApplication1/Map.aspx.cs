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
        public DataTable dt_getinfo_phong = new DataTable();
        public DataTable dt_get_khuvuc0 = new DataTable();

        public DataTable dtncc = new DataTable();

        public static string source;

        protected void Page_Load(object sender, EventArgs e)
        {
            dt_nhomhang = DataConn.StoreFillDS("NH_select_nhomhang", CommandType.StoredProcedure);
            dt_getinfo_phong = DataConn.StoreFillDS("NH_select_info_phong", CommandType.StoredProcedure);
            dt_get_khuvuc0 = DataConn.StoreFillDS("NH_select_khuvuc", CommandType.StoredProcedure);

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
        public static string huyphongban(string nameitem)  //string tenphong, string tienhang
        {
            String thongbao = "";
            DataTable dtupdate = new DataTable();

            //check xem hoa don ton tai chua
            //update *** neu hoa don ton tai roi
            //lay so hoa don truyen len de update

            dtupdate = DataConn.StoreFillDS("NH_delete_phongban", System.Data.CommandType.StoredProcedure, nameitem);

            if (dtupdate.Rows[0][0].ToString() == "1")
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
        public static string chuyenphongban(string nameitem, string newroom)  //string tenphong, string tienhang
        {
            String thongbao = "";
            DataTable dtupdate = new DataTable();

            dtupdate = DataConn.StoreFillDS("NH_Move_phongban", System.Data.CommandType.StoredProcedure, nameitem, newroom);

            if (dtupdate.Rows[0][0].ToString() == "1")
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
        public static string khthantoan(string idkhachhang, string tenphong,string tongtienhang,string tongtienhat,string psco, string tienno, string tienck, string items)  //string tenphong, string tienhang  --, 
        {

            String thongbao = "";

            DataTable dtsave = new DataTable();
            dtsave = DataConn.StoreFillDS("NH_save_khthanhtoan", System.Data.CommandType.StoredProcedure, idkhachhang, tenphong, tongtienhang, tongtienhat, psco, tienno, tienck, items);//, 

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

        [WebMethod]
        public static string thongtinhanghoa_inlai(string sohoadon)  //string tenphong, string tienhang
        {
            //check xem hoa don ton tai chua
            //update *** neu hoa don ton tai roi
            //lay so hoa don truyen len de update            
            DataTable dt = new DataTable();

            dt = DataConn.StoreFillDS("NH_infor_thongtinhanghoa_inlai", System.Data.CommandType.StoredProcedure, sohoadon);

            DataTable dt2 = new DataTable();
            dt2 = dt.Copy();

            String daresult = null;
            DataSet ds = new DataSet();
            ds.Tables.Add(dt2);
            daresult = DataSetToJSON(ds);
            return daresult;

        }

        [WebMethod]
        public static string getsohoadon()  //string tenphong, string tienhang
        {
            String kq = ""; 
            DataTable dt = new DataTable();

            dt = DataConn.StoreFillDS("NH_getsohoadon", System.Data.CommandType.StoredProcedure);

            if (dt.Rows[0][0].ToString() != "0")
            {
                kq = dt.Rows[0][0].ToString();
            }
            else
            {
                kq = "0";
            }
            return kq;

        }


    }
}