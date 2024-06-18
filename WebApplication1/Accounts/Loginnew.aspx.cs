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

namespace WebApplication1.Accounts
{
    public partial class Loginnew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["username"] = null;
                Session["password"] = null;
                
            }
        }
        
        protected void BtnLoginClick(object sender, EventArgs e)
        {
            string username = Request.Form["username"];
            string password = Request.Form["password"];
            object[] obj = new object[] { username, password };
            DataTable dt = new DataTable();
            DataTable dtchecklogindate = new DataTable();
            dtchecklogindate = DataConn.StoreFillDS("NH_check_login", CommandType.StoredProcedure);
            if (Int32.Parse(dtchecklogindate.Rows[0][0].ToString()) <= 2)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, Phiên bản của bạn đã hết hạn, liên hệ nhà cung cấp!'); ", true);
            }
            else
            {
                dt = DataConn.StoreFillDS("pro_user_login_N", CommandType.StoredProcedure, obj);
                string User = null; string Role = null; string Pass = null;
                if (dt.Rows.Count > 0)
                {
                    User = dt.Rows[0]["U_NAME"].ToString();
                    Pass = dt.Rows[0]["U_PASSWORD"].ToString();
                    Role = dt.Rows[0]["ROLE"].ToString();
                    Session["username"] = User;
                    Session["password"] = Pass;
                    Session["role"] = Role;
                    if (Role == "order")
                    {
                        //Response.Redirect("~/PhieuOrder.aspx");
                        Response.Redirect("~/OrderNhanVien.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                    //Response.Redirect("~/Default.aspx");
                }
                else
                {
                    //Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", " toastr.warning('Sai thông tin đăng nhập hoặc mật khẩu','Lỗi');", true);
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, Sai thông tin đăng nhập hoặc mật khẩu!'); ", true);

                }
            }

           
            //int status = int.Parse(dt.Rows[0][0].ToString());
            //if (status > 0)
            //{
            //    Session["username"] = username;
            //    Session["password"] = password;
            //    Response.Redirect("~/Default.aspx");
            //}
            //else
            //{               
            //    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", " toastr.warning('Sai thông tin đăng nhập hoặc mật khẩu','Lỗi');", true);
            //}
        }

        [WebMethod]
        public static string adminsupport(string passadmin)
        {
            String thongbao = "";
            DataTable dttrangthai = new DataTable();

            string namhientai = DateTime.Now.Year.ToString();
            //NH24081086
            string chuoidau = passadmin.Substring(0, 2);
            string nam = passadmin.Substring(2, 2);
            string thang = passadmin.Substring(4, 2);
            string ngay = passadmin.Substring(6, 2);
            string ngaygiahan = "20"+nam + "-" + thang + "-" + ngay;

            string chuoicuoi = passadmin.Substring(8, 2);

            if (chuoidau == "NH" && chuoicuoi=="86")
            {
                dttrangthai = DataConn.StoreFillDS("NH_get_Giahansudung", System.Data.CommandType.StoredProcedure, ngaygiahan);

                if (dttrangthai.Rows[0][0].ToString() == "1")
                {
                    //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();

                    thongbao = "OK";
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

        protected void btnDownloadIEClick(Object sender, EventArgs e)
        {
            try
            {
                string fileName = "GoogleChrome.exe";
                string fileExtension = ".exe";

                // Set Response.ContentType
                Response.ContentType = GetContentType(fileExtension);

                // Append header
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);

                // Write the file to the Response
                Response.TransmitFile(Server.MapPath("~/Files/" + fileName));
                Response.End();
            }
            catch (Exception)
            {
                throw;
            }
        }

        private string GetContentType(string fileExtension)
        {
            if (string.IsNullOrEmpty(fileExtension))
                return string.Empty;

            string contentType = string.Empty;
            switch (fileExtension)
            {
                case ".htm":
                case ".html":
                    contentType = "text/HTML";
                    break;
                case ".csv":
                case ".txt":
                    contentType = "text/plain";
                    break;

                case ".doc":
                case ".rtf":
                case ".docx":
                    contentType = "Application/msword";
                    break;

                case ".xls":
                case ".xlsx":
                    contentType = "Application/x-msexcel";
                    break;

                case ".jpg":
                case ".jpeg":
                    contentType = "image/jpeg";
                    break;

                case ".gif":
                    contentType = "image/GIF";
                    break;

                case ".pdf":
                    contentType = "application/pdf";
                    break;
            }
            return contentType;
        }

    }
}