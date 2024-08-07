﻿using System;
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
using System.IO;
using QRCoder;

//using ZXing.QrCode;
//using ZXing;
//using System.Drawing.Imaging;

namespace WebApplication1
{
    public partial class Phieubanhang : System.Web.UI.Page
    {
        public DataTable dt_doc = new DataTable();
        public DataTable dt_nhomhang = new DataTable();

        public DataTable dt_getSohd = new DataTable();
        public string sohoadon = "";       

        public DataTable dtncc = new DataTable();
        public DataTable dtdvt = new DataTable();

        public string tendovi = "";
        public string diachidonvi = "";
        public string sodtdonvi = "";
        public string ghichu = "";
        public DataTable dtdonvi = new DataTable();

        public string barcodeData = "";

        //public string tongtienhang = "";
        //public string chietkhau = "";
        //public string khachthanhtoan = "";
        //public string khachno = "";
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

                //dtdvt = DataConn.StoreFillDS("NH_Get_DVT", System.Data.CommandType.StoredProcedure);
                //DataRow newRow3 = dtdvt.NewRow();
                //newRow3["dvtto"] = "==DVT==";
                //dtdvt.Rows.InsertAt(newRow3, 0);
                //dr_dvt.DataSource = dtdvt;
                //dr_dvt.DataBind();

                dt_getSohd = DataConn.StoreFillDS("NH_getsohoadon_BH", System.Data.CommandType.StoredProcedure);
                sohoadon = dt_getSohd.Rows[0][0].ToString();

                dtdonvi = DataConn.StoreFillDS("NH_thongtin_doanhnghiep", System.Data.CommandType.StoredProcedure);
                tendovi = dtdonvi.Rows[0][1].ToString();
                diachidonvi = dtdonvi.Rows[0][5].ToString();
                sodtdonvi = dtdonvi.Rows[0][7].ToString();
                ghichu = dtdonvi.Rows[0][9].ToString();

                GenerateAndConvertQRCode(ghichu);
            }
            

        }

        private void GenerateAndConvertQRCode(string data)
        {            
            // Tạo mã QR từ dữ liệu được chuyển đến
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            //QRCodeData qrCodeData = qrGenerator.CreateQrCode(data, QRCodeGenerator.ECCLevel.Q);
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(data, QRCodeGenerator.ECCLevel.L);
            QRCode qrCode = new QRCode(qrCodeData);
            Bitmap qrCodeImage = qrCode.GetGraphic(2); // Điều chỉnh kích thước ở đây nếu cần

            // Chuyển đổi hình ảnh Bitmap thành một dạng dữ liệu base64
            using (MemoryStream memoryStream = new MemoryStream())
            {
                qrCodeImage.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Png);
                byte[] byteImage = memoryStream.ToArray();
                barcodeData = "data:image/png;base64," + Convert.ToBase64String(byteImage);
            }
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
        public static List<string> searchmahang(string _mahang)
        {
            //source = @"Data Source=10.92.186.30;Initial Catalog=Warehouse_BPS;User ID=sa;Password=Psnvdb2013";
            List<string> docResult = new List<string>();
            //using (SqlConnection con = new SqlConnection(DataConn.source))
            using (SqlConnection con = new SqlConnection(GetConnectStringFromFile()))
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
        public static string thongtinhanghoa2(string sohoadon)
        {
            DataTable dt = new DataTable();
            DataTable dtcheck = new DataTable();
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

            dt_new.Columns.Add("dvt", typeof(String));
            dt_new.Columns.Add("soluong2", typeof(String));
            dt_new.Columns.Add("dongia2", typeof(String));

            dt = DataConn.StoreFillDS("NH_infor_thongtinhanghoa2_inlai", System.Data.CommandType.StoredProcedure, idhoadon);

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

                var dvt = numbersArray[3];
                var soluong2 = 1;
                var dongia2 = 0;
                //check xem mahang co cau thanh hay khong?
                dtcheck = DataConn.StoreFillDS("NH_check_cauthanh_dvt", System.Data.CommandType.StoredProcedure, mahang);
                if (dtcheck.Rows[0][0].ToString() == "1")
                {
                    //co cau thanh
                    soluong2 = Int32.Parse(numbersArray[4]);
                    dongia2 = Int32.Parse(thanhtien1) / soluong2;
                }
                else
                {
                    //khong co cau thanh
                    soluong2 = item.Value;
                    dongia2 = Int32.Parse(dongia1);
                }

                var soluong = item.Value;


                dt_new.Rows.Add(mahang, soluong, dongia1, "", thanhtien1, "", "", "", "", dvt, soluong2, dongia2);
                //dt_new.Rows.Add(mahang, soluong, dongia1, "", thanhtien1, "", "", "", "");
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

        [WebMethod]
        public static string GetDVT(string hanghoa, string typefill)
        {
            string ckhanghoa = hanghoa;
            string cktypefill = typefill;


            DataTable dt = new DataTable();

            dt = DataConn.StoreFillDS("NH_select_dvt", System.Data.CommandType.StoredProcedure, ckhanghoa, cktypefill);

            return DataTableToJson(dt);

            //DataTable dt2 = new DataTable();
            //dt2 = dt.Copy();

            //String daresult = null;
            //DataSet ds = new DataSet();
            //ds.Tables.Add(dt2);
            //daresult = DataSetToJSON(ds);
            //return daresult;
        }

        private static string DataTableToJson(DataTable dt)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>> rows = new System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>();
            foreach (DataRow dr in dt.Rows)
            {
                System.Collections.Generic.Dictionary<string, object> row = new System.Collections.Generic.Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
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
        public static string addthongtinhanghoa_PBH(string suahoadon, string sohoadon, string thanhtoantien, string psno, string chieukhau, string nhacungcap, string tienhang, string items)  //string tenphong, string tienhang
        {
            String thongbao = "";
            DataTable dtsave = new DataTable();
            DataTable dtupdatekho = new DataTable();
            try
            {
                JavaScriptSerializer jss = new JavaScriptSerializer();
                var jsonObj = jss.Deserialize<dynamic>(items);
                string type_act = "banhang";

                //{"bia ha noi":1,"Bò khô":2}
                //them moi mot cot ton dau ky trong bang socai
                string listtoncuoiky = "";
                if (suahoadon == "1")
                {
                    //truong hop sua hoa don, khong update ton kho
                    //ton kho se duoc update o thao tac sua xoa.
                    //da chon vao sua hoa don thi bat phai luu lai hoa don  ==> truong hop nay phai bat chat o client
                    foreach (var item in jsonObj)
                    {
                        string[] numbersArray = item.Key.Split(',');
                        var mahang = numbersArray.FirstOrDefault();
                        var soluong = item.Value;
                        //Console.WriteLine($"Key: {key}, Value: {value}");
                        dtupdatekho = DataConn.StoreFillDS("NH_updatekho_BH_suaHD", System.Data.CommandType.StoredProcedure, mahang, soluong, type_act);
                        var sltoncuoiky = dtupdatekho.Rows[0][1].ToString();
                        listtoncuoiky = listtoncuoiky + '"' + mahang + '"' + ':' + sltoncuoiky + ',';
                    }

                }
                else
                {
                    //van update ton kho binh thuong
                    foreach (var item in jsonObj)
                    {
                        string[] numbersArray = item.Key.Split(',');
                        var mahang = numbersArray.FirstOrDefault();
                        var soluong = item.Value;
                        //Console.WriteLine($"Key: {key}, Value: {value}");
                        dtupdatekho = DataConn.StoreFillDS("NH_updatekho_BH", System.Data.CommandType.StoredProcedure, mahang, soluong, type_act);
                        var sltoncuoiky = dtupdatekho.Rows[0][1].ToString();
                        listtoncuoiky = listtoncuoiky + '"' + mahang + '"' + ':' + sltoncuoiky + ',';
                    }
                }

                listtoncuoiky = listtoncuoiky.Substring(0, listtoncuoiky.Length - 1);
                listtoncuoiky = '{' + listtoncuoiky + '}';
                //check xem hoa don ton tai chua
                //update *** neu hoa don ton tai roi
                //lay so hoa don truyen len de update
                dtsave = DataConn.StoreFillDS("addthongtinhanghoa_PBH", System.Data.CommandType.StoredProcedure, suahoadon, sohoadon, thanhtoantien, psno, chieukhau, nhacungcap, tienhang, items, listtoncuoiky);

                if (dtsave.Rows[0][0].ToString() == "1")
                {
                    //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();

                    //thongbao = "OK" + "," + dtsave.Rows[0][1].ToString();
                    thongbao = dtsave.Rows[0][1].ToString();
                }
                else
                {
                    thongbao = "NG";
                }
                return thongbao;
            }
            catch (Exception)
            {
                thongbao = "NG";
                return thongbao;
                //throw;
            }                       
        }


        [WebMethod]
        public static string Xemlaihoadon(string sohoadon)
        {
            DataTable dt = new DataTable();
            DataTable dtcheck = new DataTable();
            string idhoadon = sohoadon;

            DataTable dt_new = new DataTable();
            dt_new.Columns.Add("tenhang", typeof(String));
            dt_new.Columns.Add("soluong", typeof(String));
            dt_new.Columns.Add("dongia", typeof(String));
            dt_new.Columns.Add("thanhtien", typeof(String));

            dt_new.Columns.Add("chietkhau", typeof(String));
            dt_new.Columns.Add("tongtienhang", typeof(String));
            dt_new.Columns.Add("khachthanhtoan", typeof(String));
            dt_new.Columns.Add("psco", typeof(String));

            dt_new.Columns.Add("dvt", typeof(String));
            dt_new.Columns.Add("soluong2", typeof(String));
            dt_new.Columns.Add("dongia2", typeof(String));


            dt = DataConn.StoreFillDS("NH_Xemlaihoadon2", System.Data.CommandType.StoredProcedure, idhoadon);

            string items = dt.Rows[0][0].ToString();

            JavaScriptSerializer jss = new JavaScriptSerializer();
            var jsonObj = jss.Deserialize<dynamic>(items);

            foreach (var item in jsonObj)
            {
                string[] numbersArray = item.Key.Split(',');
                var tenhang = numbersArray.FirstOrDefault();
                //string[] strArray = mahang.Split(',');
                var mahang1 = numbersArray[0];
                var dongia1 = numbersArray[1];
                var thanhtien1 = numbersArray[2];

                var dvt = numbersArray[3];
                var soluong2 = Int32.Parse(numbersArray[4]);
                var dongia2 = 0;// Int32.Parse(thanhtien1) / soluong2;  //ben client khong lay gia tri nay

                var soluong = item.Value;

                //dt_new.Rows.Add(tenhang, soluong, dongia1, thanhtien1, "", "", "", "");
                dt_new.Rows.Add(tenhang, soluong, dongia1, thanhtien1, "", "", "", "", dvt, soluong2, dongia2);
            }
            //tongtienhang = dt.Rows[0]["tienhang"].ToString();
            //chietkhau = dt.Rows[0]["chietkhau"].ToString();
            //khachthanhtoan = dt.Rows[0]["tiensauchietkhau"].ToString();
            //khachno = dt.Rows[0]["psco"].ToString();

            //string hoadonid = dt.Rows[0]["sohoadon"].ToString();
            //dt_new.Rows.Add("", "0", "0", "0", chietkhau, tongtienhang, khachthanhtoan, khachno);

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
        public static string thongtinhanghoa(string idhoadon)  //string tenphong, string tienhang
        {
            //check xem hoa don ton tai chua
            //update *** neu hoa don ton tai roi
            //lay so hoa don truyen len de update            
            DataTable dt = new DataTable();
            DataTable dtcheck = new DataTable();

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

            dt_new.Columns.Add("dvt", typeof(String));
            dt_new.Columns.Add("soluong2", typeof(String));
            dt_new.Columns.Add("dongia2", typeof(String));


            dt = DataConn.StoreFillDS("NH_infor_thongtinhanghoa2", System.Data.CommandType.StoredProcedure, idhoadon);

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

                var dvt = numbersArray[3];
                var soluong2 = 1;
                var dongia2 =0;
                //check xem mahang co cau thanh hay khong?
                dtcheck = DataConn.StoreFillDS("NH_check_cauthanh_dvt", System.Data.CommandType.StoredProcedure, mahang);
                if (dtcheck.Rows[0][0].ToString() == "1")
                {
                    //co cau thanh
                    soluong2 = Int32.Parse(numbersArray[4]);
                    dongia2 = Int32.Parse(thanhtien1) / soluong2;
                }
                else
                {
                    //khong co cau thanh
                    soluong2 = item.Value;
                    dongia2 = Int32.Parse(dongia1);
                }

                //var soluong2 = numbersArray[4];
                //var dongia2 = Int32.Parse(thanhtien1) / Int32.Parse(soluong2);

                var soluong = item.Value;
                //Console.WriteLine($"Key: {key}, Value: {value}");

                //string _tenhang = mahang;
                //string _soluong = soluong;
               //string _dongia = dongia1;
                //string _thanhtien = thanhtien1;

                //dt_new.Rows.Add(mahang, soluong, dongia1,"", thanhtien1,"","","","");
                dt_new.Rows.Add(mahang, soluong, dongia1, "", thanhtien1, "", "", "", "", dvt, soluong2, dongia2);
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
        public static string danhsachhanghoacantim(string mahangtk)  
        {         
            DataTable dt = new DataTable();            
            dt = DataConn.StoreFillDS("NH_timkiemhanghoa", System.Data.CommandType.StoredProcedure, mahangtk);

            DataTable dt2 = new DataTable();
            // dt2 = dt.Copy();
            dt2 = dt.Copy();

            String daresult = null;
            DataSet ds = new DataSet();
            ds.Tables.Add(dt2);
            daresult = DataSetToJSON(ds);
            return daresult;
        }

        [WebMethod]
        public static string updatetonkhoxoahang(string tenhang, string soluongxoa) 
        {
            String thongbao = "";
            DataTable dtupdate = new DataTable();

            dtupdate = DataConn.StoreFillDS("htupdate_tonkho_xoahang", System.Data.CommandType.StoredProcedure, tenhang, soluongxoa);

            thongbao = "OK";
            return thongbao;
        }

        [WebMethod]
        public static string updatetonkhosuahang(string tenhang, string soluongupdate)  //string tenphong, string tienhang
        {
            String thongbao = "";
            DataTable dtupdate = new DataTable();

            dtupdate = DataConn.StoreFillDS("htupdate_tonkho_suahang", System.Data.CommandType.StoredProcedure, tenhang, soluongupdate);

            thongbao = "OK";
            return thongbao;
        }

        [WebMethod]
        public static string laymahang_chuan(string mahang)  //string tenphong, string tienhang
        {
            String thongbao = "";
            DataTable dtmahang = new DataTable();

            dtmahang = DataConn.StoreFillDS("NH_laymahang_tk_chuan", System.Data.CommandType.StoredProcedure, mahang);//tenphong, data, tienhang
           

            if (dtmahang.Rows[0][0].ToString() != "0")
            {
                //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();
                //thongbao = dtmahang.Rows[0][0].ToString();
                thongbao = dtmahang.Rows[0][0].ToString() + "," + dtmahang.Rows[0][1].ToString() + "," + dtmahang.Rows[0][2].ToString();
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;
        }

        [WebMethod]
        public static string laydungtenhang(string mahang_chuan)  //string tenphong, string tienhang
        {
            String thongbao = "";
            DataTable dtmahang = new DataTable();

            dtmahang = DataConn.StoreFillDS("NH_laydungtenhang", System.Data.CommandType.StoredProcedure, mahang_chuan);//tenphong, data, tienhang

            if (dtmahang.Rows[0][0].ToString() != "0")
            {
                //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();
                //thongbao = dtmahang.Rows[0][0].ToString();
                thongbao = dtmahang.Rows[0][0].ToString();
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;
        }

        [WebMethod]
        public static string laymahangscan(string tenhangid)  //string tenphong, string tienhang
        {
            String thongbao = "";
            DataTable dtmahang = new DataTable();
            DataTable dtdvt2 = new DataTable();

            dtmahang = DataConn.StoreFillDS("NH_laydungmahang", System.Data.CommandType.StoredProcedure, tenhangid);//tenphong, data, tienhang          

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

        [WebMethod]
        public static string dongiacauthanhdvt(string mahang, string dvtto)  //string tenphong, string tienhang
        {
            String thongbao = "";           
            DataTable dtdvt = new DataTable();

            dtdvt = DataConn.StoreFillDS("NH_dongia_cauthanh_dvt", System.Data.CommandType.StoredProcedure, mahang, dvtto);          

            if (dtdvt.Rows[0][0].ToString() == "1")
            {
                //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();
                //thongbao = dtmahang.Rows[0][0].ToString();
                thongbao =  dtdvt.Rows[0][1].ToString();
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;
        }

        [WebMethod]
        public static string Savekhachhang(string idmakh, string idtenkh, string idcongnoden, string idcongnodi)
        {
            string thongbao = "";
            DataTable dt = new DataTable();
            dt = DataConn.StoreFillDS("NH_insert_khachhang", System.Data.CommandType.StoredProcedure, idmakh, idtenkh, idcongnoden, idcongnodi);
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
        public static string laysoluongdvt(string donvinhonhat, string kiemtramahang, string donvilonhon)
        {
            string thongbao = "";
            DataTable dt = new DataTable();
            dt = DataConn.StoreFillDS("NH_show_dvt", System.Data.CommandType.StoredProcedure, donvinhonhat, kiemtramahang, donvilonhon);

            if (dt.Rows.Count > 0)
            {
                if(dt.Rows[0][0].ToString() != "0")
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
                thongbao = dtmahang.Rows[0][0].ToString() + "," + dtmahang.Rows[0][1].ToString() + "," + dtmahang.Rows[0][2].ToString();
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;
        }



    }
}