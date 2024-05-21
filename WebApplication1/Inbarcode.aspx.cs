using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Drawing;

using ZXing.QrCode;
using ZXing;
using System.Drawing.Imaging;
using System.IO;
using System.Drawing.Printing;
using System.Data;
using WebApplication1.App_Code;
using System.Web.Services;

namespace WebApplication1
{
    public partial class Inbarcode : System.Web.UI.Page
    {
        //public string User_ID;
        public DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.Cookies["UserId"] != null && Request.Cookies["UserPassWord"] != null)
            //{
            //    User_ID = Request.Cookies["UserId"].Value;
            //}
            //else
            //{
            //    Response.Redirect(@"\LoginForm.aspx");
            //}
            if (!IsPostBack)
            {
                //LoadModel();
                dt = DataConn.StoreFillDS("NH_danhsachinbarcode", System.Data.CommandType.StoredProcedure);
            }
        }

        private string GenerateQRCodeBase64(string data, int w, int h)
        {
            BarcodeWriter barcodeWriter = new BarcodeWriter();
            barcodeWriter.Format = BarcodeFormat.QR_CODE;
            barcodeWriter.Options = new QrCodeEncodingOptions
            {
                Width = w,
                Height = h
            };
            Bitmap qrCodeBitmap = barcodeWriter.Write(data);
            string base64String = Convert.ToBase64String(BitmapToBytes(qrCodeBitmap));
            return base64String;
        }
        private byte[] BitmapToBytes(Bitmap bitmap)
        {
            using (MemoryStream stream = new MemoryStream())
            {
                bitmap.Save(stream, ImageFormat.Png);
                return stream.ToArray();
            }
        }

       

        protected void btn_inmavach_Click(object sender, EventArgs e)
        {                         
            dt = DataConn.StoreFillDS("NH_danhsachinbarcode", System.Data.CommandType.StoredProcedure);

            if (dt.Rows.Count < 1)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông báo", $"alert('Không có dữ liệu master')", true);
            }
            else
            {                                              
                string htmlinner = "";
                for (int i = 0; i <= dt.Rows.Count-1; i++)
                {
                    string mahang = dt.Rows[i][0].ToString();
                    string tenhang = dt.Rows[i][1].ToString();
                    string giaban = dt.Rows[i][2].ToString();

                    //string QRPAPVN = GenerateQRCodeBase64($"{Model};{DateForPrint};{StockeyPrint}", 120, 120);
                    string QRPAPVN = GenerateQRCodeBase64($"{mahang}", 60, 60);
                    //string QRPSNV = GenerateQRCodeBase64($"{Model}", 60, 60);
                    htmlinner += $"  <div   class=\"myrow\">\r\n &nbsp;&nbsp;&nbsp;{giaban} <br> <img src=\"data:image/png;base64,{QRPAPVN}\" alt=\"QR Code\" />\r\n <br>&nbsp;&nbsp;&nbsp;{mahang} </div>";
                    //if (i % 6 == 0)
                    //{
                    //    htmlinner += $"  <div   class=\"myrow\">\r\n &nbsp;&nbsp;&nbsp;{giaban} <br> <img src=\"data:image/png;base64,{QRPAPVN}\" alt=\"QR Code\" />\r\n <br>&nbsp;&nbsp;&nbsp;{mahang} </div>";
                    //}
                    //else
                    //{
                    //    htmlinner += $"  <div class=\"myrow\">\r\n &nbsp;&nbsp;&nbsp;{mahang}<br> <img src=\"data:image/png;base64,{QRPAPVN}\" alt=\"QR Code\" />\r\n  <br> &nbsp;&nbsp;&nbsp;{mahang}  </div>";
                    //}
                }
                ContentBody.InnerHtml = htmlinner;               
            }

        }

       

        private void DeleteCookie(string cookieName)
        {
            //Response.Cookies.Remove(cookieName);
            Response.Cookies[cookieName].Expires = DateTime.Now.AddDays(-1);
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            //DeleteCookie("UserId");
            //DeleteCookie("UserPassWord");
            //DeleteCookie("MasterCookie");
            //Response.Redirect(@"\FormPrint.aspx");
        }






    }
}