using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QRCoder;
using System.Drawing;
using System.IO;


namespace WebApplication1
{
    public partial class MakeQRcode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void btnGenerate_Click(object sender, EventArgs e)
        //{
        //    if (txtQRCode.Text != "" && txt_width.Text != "" && txt_height.Text != "")
        //    {
        //        string code = txtQRCode.Text;
        //        QRCodeGenerator qrGenerator = new QRCodeGenerator();
        //        QRCodeData qrdata = qrGenerator.CreateQrCode(code, QRCodeGenerator.ECCLevel.Q);
        //        QRCode qrCode = new QRCode(qrdata);
        //        System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();
        //        imgBarCode.Height = int.Parse(txt_height.Text);
        //        imgBarCode.Width = int.Parse(txt_width.Text);
        //        using (Bitmap bitMap = qrCode.GetGraphic(20))
        //        {
        //            using (MemoryStream ms = new MemoryStream())
        //            {
        //                bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
        //                byte[] byteImage = ms.ToArray();
        //                imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
        //            }
        //            PlaceHolder1.Controls.Add(imgBarCode);
        //        }
        //    }
        //    else
        //    {
        //        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "alert('ERROR, Please input enough information again!'); ", true);
        //    }

        //}

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            // Tạo mã QR
            string qrContent = txtQRCode.Text; // Lấy nội dung từ TextBox
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(qrContent, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);

            // Chuyển đổi mã QR thành hình ảnh
            Bitmap qrCodeImage = qrCode.GetGraphic(20);

            // Lưu hình ảnh vào bộ nhớ đệm và gán đường dẫn cho control hình ảnh
            MemoryStream ms = new MemoryStream();
            qrCodeImage.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            byte[] byteImage = ms.ToArray();
            qrCodeImage.Dispose();
            //qrCodeImage.Suspend();
            string base64String = Convert.ToBase64String(byteImage, 0, byteImage.Length);
            string imageUrl = "data:image/png;base64," + base64String;

            // Hiển thị hình ảnh QR trên giao diện
            //PlaceHolder1.Controls.Add(new Image { ImageUrl = imageUrl });
        }


    }
}