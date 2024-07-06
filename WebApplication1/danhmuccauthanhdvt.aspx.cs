using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using WebApplication1.App_Code;
using System.Web.Services;


using System.Data.SqlClient;
using System.IO;

namespace WebApplication1
{
    public partial class danhmuccauthanhdvt : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_dvt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //dt_dvt = DataConn.StoreFillDS("NH_DMCauthanhDVT", System.Data.CommandType.StoredProcedure);
                if (!IsPostBack)
                {
                    string tenhanghoa = Request.QueryString["tenhanghoa"];                 
                    if (!string.IsNullOrEmpty(tenhanghoa))
                    {
                        string tenhang = tenhanghoa.Replace("'", "");
                        // Xử lý biến tenhanghoa đã nhận được từ frontend
                        // Ví dụ:
                        // Response.Write("Giá trị tenhanghoa là: " + tenhanghoa);
                        dt_dvt = DataConn.StoreFillDS("NH_DMCauthanhDVT_timkiem", System.Data.CommandType.StoredProcedure, tenhang);
                    }
                    else
                    {
                        dt_dvt = DataConn.StoreFillDS("NH_DMCauthanhDVT", System.Data.CommandType.StoredProcedure);
                    }
                }
            }
        }

        //public void themkhuvuc(object sender, EventArgs e)
        //{
        //    //string id = txtid.Text;
        //    string mahang = mahangid.Text;
        //    string donvito = dvtoid.Text;
        //    string soluongquydoi = slquydoiid.Text;
        //    string donvinho = dvnhoid.Text;

        //    string gianhap = txtgianhap.Text;
        //    string giasi = txtgiasi.Text;
        //    string giaban = txtgiaban.Text;
        //    string giacauthanh = txtgiadonvito.Text;

        //    if (mahang == "")
        //    {
        //        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, Mã hàng trống!'); ", true);
        //    }
        //    else if (donvito == "")
        //    {
        //        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, Chưa nhập đơn vị quy đổi!'); ", true);
        //    }
        //    else if (soluongquydoi == "")
        //    {
        //        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, Chưa nhập số lượng quy đổi!'); ", true);
        //    }
        //    else if (giacauthanh == "")
        //    {
        //        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, Giá cấu thành trống!'); ", true);
        //    }
        //    else
        //    {
        //        DataTable dtinsert = new DataTable();
        //        dtinsert = DataConn.StoreFillDS("NH_insert_cauthanhdvt", System.Data.CommandType.StoredProcedure, mahang, donvito, soluongquydoi, donvinho, gianhap, giasi, giaban, giacauthanh);
        //        if (dtinsert.Rows[0][0].ToString() == "1")
        //        {
        //            dt_dvt = DataConn.StoreFillDS("NH_DMCauthanhDVT", System.Data.CommandType.StoredProcedure);
        //            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
        //        }
        //        else
        //        {
        //            Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, Đã tồn tại thông tin!'); ", true);
        //        }
        //    }
        //}

        public void timkiemmahang(object sender, EventArgs e)
        {
            //string id = txtid.Text;
            string tenhang1 = phieunhaphang.UniqueID;
            string tenhang = phieunhaphang.Text.ToString();
            dt_dvt = DataConn.StoreFillDS("NH_DMCauthanhDVT_timkiem", System.Data.CommandType.StoredProcedure, tenhang);

        }

        [WebMethod]
        public static string laymahang_chuan(string mahang)
        {
            String thongbao = "";
            DataTable dtmahang = new DataTable();
            dtmahang = DataConn.StoreFillDS("NH_laymahang_tk_chuan", System.Data.CommandType.StoredProcedure, mahang);
            if (dtmahang.Rows[0][0].ToString() != "0")
            {
                thongbao = dtmahang.Rows[0][0].ToString() + "," + dtmahang.Rows[0][1].ToString() + "," + dtmahang.Rows[0][2].ToString();
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;
        }

        [WebMethod]
        public static string timkiemhanghoa(string tenhang)
        {
            String thongbao = "";
            DataTable dtmahang = new DataTable();
            //dt_dvt = DataConn.StoreFillDS("NH_DMCauthanhDVT_timkiem", System.Data.CommandType.StoredProcedure, tenhang);

            thongbao = tenhang;
            return thongbao;
        }

        [WebMethod]
        public static string themmoicauthanh(string mahang, string donvito, string soluongquydoi, string donvinho, string gianhap, string giasi, string giaban, string giacauthanh)
        {
            String thongbao = "";
            if (mahang == "")
            {
                thongbao = "NG";
            }
            else if (donvito == "")
            {
                thongbao = "NG";
            }
            else if (soluongquydoi == "")
            {
                thongbao = "NG";
            }
            else if (giacauthanh == "")
            {
                thongbao = "NG";
            }
            else
            {
                DataTable dtinsert = new DataTable();
                dtinsert = DataConn.StoreFillDS("NH_insert_cauthanhdvt", System.Data.CommandType.StoredProcedure, mahang, donvito, soluongquydoi, donvinho, gianhap, giasi, giaban, giacauthanh);
                if (dtinsert.Rows[0][0].ToString() == "1")
                {
                    thongbao = "OK";                    
                }
                else
                {
                    thongbao = "NG";
                }
            }


            return thongbao;
        }

        public void updatekhuvuc(object sender, EventArgs e)
        {
            string id = txtid.Text;
            string mahang = txtmahang.Text;
            string donvito = txtto.Text;
            string soluongquydoi = txtquydoi.Text;
            string donvinho = txtnho.Text;

            string gianhap = suagianhap.Text;
            string giasi = suagiasi.Text;
            string giaban = suagiaban.Text;
            string giacauthanh = suagiadvto.Text;

            DataTable dtupdate = new DataTable();
            dtupdate = DataConn.StoreFillDS("NH_update_cauthanhdvt", System.Data.CommandType.StoredProcedure, id, mahang, donvito, soluongquydoi, donvinho, gianhap, giasi, giaban, giacauthanh);
            if (dtupdate.Rows[0][0].ToString() == "1")
            {
                dt_dvt = DataConn.StoreFillDS("NH_DMCauthanhDVT", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, kiểm tra lại thông tin!'); ", true);
            }

        }


    }
}