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
    //public class OrderList
    //{
    //    public List<Danhmuc> Orders { get; set; }
    //}
    //public class Danhmuc
    //{
    //    public string mahang { get; set; }
    //    public string soluong { get; set; }      
    //}

    public partial class Phieunhaphang : System.Web.UI.Page
    {
        public DataTable dt_doc = new DataTable();
        public DataTable dt_nhomhang = new DataTable();

        public DataTable dtncc = new DataTable();

        public DataTable dt_getSohd = new DataTable();
        public DataTable dtdvt = new DataTable();
        public string sohoadon = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindStockCode();
                dtncc = DataConn.StoreFillDS("NH_Get_NCC", System.Data.CommandType.StoredProcedure);
                DataRow newRow2 = dtncc.NewRow();
                newRow2["mancc"] = "==NCC==";
                dtncc.Rows.InsertAt(newRow2, 0);
                dr_nhacungcap.DataSource = dtncc;
                dr_nhacungcap.DataBind();

                dtdvt = DataConn.StoreFillDS("NH_Get_DVT", System.Data.CommandType.StoredProcedure);
                DataRow newRow3 = dtdvt.NewRow();
                newRow3["dvtto"] = "==DVT==";
                dtdvt.Rows.InsertAt(newRow3, 0);
                dr_dvt.DataSource = dtdvt;
                dr_dvt.DataBind();

                dt_getSohd = DataConn.StoreFillDS("NH_getsohoadon_NH", System.Data.CommandType.StoredProcedure);
                sohoadon = dt_getSohd.Rows[0][0].ToString();

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
                    //cmd.CommandText = "select Top 10 a.mahang from [Warehouse_BPS].[dbo].[hthanghoa] a where a.mahang like '%'+@_mahang+'%' ;";
                    cmd.CommandText = "select Top 10 a.tenhang from hthanghoa a where a.tenhang like '%'+@_mahang+'%' ;";
                    cmd.Connection = con;
                    con.Open();
                    cmd.Parameters.AddWithValue("@_mahang", _mahang);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        //docResult.Add(dr["mahang"].ToString());
                        docResult.Add(dr["tenhang"].ToString());
                    }
                    con.Close();
                    return docResult;
                }
            }
        }

        [WebMethod]
        public static string laysoluongdvt(string donvinhonhat, string kiemtramahang, string donvilonhon)
        {
            string thongbao = "";
            DataTable dt = new DataTable();
            dt = DataConn.StoreFillDS("NH_show_dvt", System.Data.CommandType.StoredProcedure, donvinhonhat, kiemtramahang, donvilonhon);

            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0][0].ToString() != "0")
                {
                    //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();

                    thongbao = dt.Rows[0][1].ToString();
                    //thongbao = dt.Rows[0][0].ToString() + "," + dt.Rows[0][1].ToString();
                }
                else
                {
                    thongbao = "NG";
                }
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;
        }

        [WebMethod]
        public static string laymahang(string tenhang)  //string tenphong, string tienhang
        {
            String thongbao = "";
            DataTable dtmahang = new DataTable();

            dtmahang = DataConn.StoreFillDS("NH_laymahang_tk", System.Data.CommandType.StoredProcedure, tenhang);//tenphong, data, tienhang

            if (dtmahang.Rows[0][0].ToString() != "0")
            {
                //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();
                //thongbao = dtmahang.Rows[0][0].ToString();
                thongbao = dtmahang.Rows[0][0].ToString() + "," + dtmahang.Rows[0][1].ToString();
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;
        }

        //protected void Savekhachhang(object sender, EventArgs e)
        //{
        //    string makh = idmakh.Text;// Request.Form["username"];
        //    string tenkh = idtenkh.Text;//; Request.Form["password"];
        //    string congnoden = idcongnoden.Text;
        //    string congnodi = idcongnodi.Text;
        //    DataTable dt = new DataTable();
        //    dt = DataConn.StoreFillDS("NH_insert_nhacungcap", System.Data.CommandType.StoredProcedure, makh, tenkh, congnoden, congnodi);

        //    if (dt.Rows[0][0].ToString() == "1")
        //    {
        //        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Thêm mới thành công!'); ", true);
        //        idmakh.Text = "0";
        //        idtenkh.Text = "0";
        //        idcongnoden.Text = "0";
        //        idcongnodi.Text = "0";
        //    }
        //    else
        //    {
        //        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, Kiểm tra lại thông tin!'); ", true);
        //    }
        //}

        [WebMethod]
        public static string Savekhachhang(string idmakh,string idtenkh, string idcongnoden, string idcongnodi)
        {
            string thongbao = "";
            DataTable dt = new DataTable();
           

            dt = DataConn.StoreFillDS("NH_insert_nhacungcap", System.Data.CommandType.StoredProcedure, idmakh, idtenkh, idcongnoden, idcongnodi);
            if (dt.Rows[0][0].ToString() != "0")
            {
                //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();

                //thongbao = "OK";
                thongbao = dt.Rows[0][0].ToString() + "," + dt.Rows[0][1].ToString();
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;

        }

        [WebMethod]
        public static string getthongtinmahang(string _mahang)
        {
            DataTable dt = new DataTable();

            dt = DataConn.StoreFillDS("NH_select_documentNo_NH", System.Data.CommandType.StoredProcedure, _mahang);

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
        public static string addthongtinhanghoa_PNH(string thanhtoantien, string psno, string chieukhau, string nhacungcap, string tienhang, string items)  //string tenphong, string tienhang
        {
            String thongbao = "";
            DataTable dtsave = new DataTable();
            DataTable dtupdatekho = new DataTable();

            JavaScriptSerializer jss = new JavaScriptSerializer();
            var jsonObj = jss.Deserialize<dynamic>(items);
            string type_act = "nhaphang";            

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
            dtsave = DataConn.StoreFillDS("addthongtinhanghoa_PNH", System.Data.CommandType.StoredProcedure, thanhtoantien, psno, chieukhau, nhacungcap, tienhang, items);

            if (dtsave.Rows[0][0].ToString() == "1")
            {
                //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();

                //thongbao = "OK";
                thongbao = dtsave.Rows[0][1].ToString();
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;
        }

        [WebMethod]
        public static string thongtinhanghoa(string idhoadon)  //string tenphong, string tienhang
        {
            //check xem hoa don ton tai chua
            //update *** neu hoa don ton tai roi
            //lay so hoa don truyen len de update            
            DataTable dt = new DataTable();

            DataTable dt_new = new DataTable();
            dt_new.Columns.Add("tenhang", typeof(String));
            dt_new.Columns.Add("soluong", typeof(String));
            dt_new.Columns.Add("dongia", typeof(String));
            dt_new.Columns.Add("chietkhau", typeof(String));
            dt_new.Columns.Add("thanhtien", typeof(String));
            dt_new.Columns.Add("khachthanhtoan", typeof(String));
            dt_new.Columns.Add("psco", typeof(String));
            dt_new.Columns.Add("ngaytao", typeof(String));
            dt_new.Columns.Add("sohodon", typeof(String));


            dt = DataConn.StoreFillDS("NH_infor_thongtinhanghoa2_NH", System.Data.CommandType.StoredProcedure, idhoadon);

            string items = dt.Rows[0][0].ToString();

            JavaScriptSerializer jss = new JavaScriptSerializer();
            var jsonObj = jss.Deserialize<dynamic>(items);

            foreach (var item in jsonObj)
            {
                string[] numbersArray = item.Key.Split(',');
                var mahang = numbersArray.FirstOrDefault();
                //string[] strArray = mahang.Split(',');
                var mahang1 = numbersArray[0];
                var dongia1 = numbersArray[1];
                var thanhtien1 = numbersArray[2];

                var soluong = item.Value;
                //Console.WriteLine($"Key: {key}, Value: {value}");

                //string _tenhang = mahang;
                //string _soluong = soluong;
                //string _dongia = dongia1;
                //string _thanhtien = thanhtien1;

                dt_new.Rows.Add(mahang, soluong, dongia1, "", thanhtien1, "", "", "", "");
            }

            //string chietkhau = dt.Rows[0]["chietkhau"].ToString();
            //string tongtien = dt.Rows[0]["tienhang"].ToString();
            //string khachthanhtoan = dt.Rows[0]["tiensauchietkhau"].ToString();
            //string khachno = dt.Rows[0]["psco"].ToString();
            //string ngaytao = dt.Rows[0]["created"].ToString();
            //string sohoadon = dt.Rows[0]["sohoadon"].ToString();
            //dt_new.Rows.Add("", "", "", chietkhau, tongtien,khachthanhtoan,khachno,ngaytao,sohoadon);


            DataTable dt2 = new DataTable();
            // dt2 = dt.Copy();
            dt2 = dt_new.Copy();

            String daresult = null;
            DataSet ds = new DataSet();
            ds.Tables.Add(dt2);
            daresult = DataSetToJSON(ds);
            return daresult;

        }

        [WebMethod]
        public static string thongtinhanghoa2(string sohoadon)
        {
            DataTable dt = new DataTable();
            string idhoadon = sohoadon;

            DataTable dt_new = new DataTable();
            dt_new.Columns.Add("tenhang", typeof(String));
            dt_new.Columns.Add("soluong", typeof(String));
            dt_new.Columns.Add("dongia", typeof(String));
            dt_new.Columns.Add("chietkhau", typeof(String));
            dt_new.Columns.Add("thanhtien", typeof(String));
            dt_new.Columns.Add("khachthanhtoan", typeof(String));
            dt_new.Columns.Add("psco", typeof(String));
            dt_new.Columns.Add("ngaytao", typeof(String));
            dt_new.Columns.Add("sohodon", typeof(String));


            dt = DataConn.StoreFillDS("NH_infor_thongtinhanghoa2_inlai_NH", System.Data.CommandType.StoredProcedure, idhoadon);

            string items = dt.Rows[0][0].ToString();

            JavaScriptSerializer jss = new JavaScriptSerializer();
            var jsonObj = jss.Deserialize<dynamic>(items);

            foreach (var item in jsonObj)
            {
                string[] numbersArray = item.Key.Split(',');
                var mahang = numbersArray.FirstOrDefault();
                //string[] strArray = mahang.Split(',');
                var mahang1 = numbersArray[0];
                var dongia1 = numbersArray[1];
                var thanhtien1 = numbersArray[2];

                var soluong = item.Value;

                dt_new.Rows.Add(mahang, soluong, dongia1, "", thanhtien1, "", "", "", "");
            }

            string chietkhau = dt.Rows[0]["chietkhau"].ToString();
            string tongtien = dt.Rows[0]["tienhang"].ToString();
            string khachthanhtoan = dt.Rows[0]["tiensauchietkhau"].ToString();
            string khachno = dt.Rows[0]["psco"].ToString();
            string ngaytao = dt.Rows[0]["created"].ToString();
            //string hoadonid = dt.Rows[0]["sohoadon"].ToString();
            dt_new.Rows.Add("", "", "", chietkhau, tongtien, khachthanhtoan, khachno, ngaytao, "");


            DataTable dt2 = new DataTable();
            // dt2 = dt.Copy();
            dt2 = dt_new.Copy();

            String daresult = null;
            DataSet ds = new DataSet();
            ds.Tables.Add(dt2);
            daresult = DataSetToJSON(ds);
            return daresult;
        }


    }
}