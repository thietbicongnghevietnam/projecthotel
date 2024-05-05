using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebApplication1.App_Code;
using System.Web.Services;
using Newtonsoft.Json.Linq;
using System.Web.Script.Serialization;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Text;
using System.IO;

namespace WebApplication1.Danhmuc
{
    public partial class Danhmuchanghoa : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_hanghoa = new DataTable();
        public DataTable dt_nhomhang = new DataTable();
        public DataTable dt_nhomhang2 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt_hanghoa = DataConn.StoreFillDS("NH_danhmuchanghoa", System.Data.CommandType.StoredProcedure);

                dt_nhomhang = DataConn.StoreFillDS("NH_Get_nhomhang", System.Data.CommandType.StoredProcedure);
                DataRow newRow2 = dt_nhomhang.NewRow();
                newRow2["manhomhang"] = "==chon nhom hang==";
                dt_nhomhang.Rows.InsertAt(newRow2, 0);
                dr_nhomhang.DataSource = dt_nhomhang;
                dr_nhomhang.DataBind();

                dt_nhomhang2 = DataConn.StoreFillDS("NH_Get_nhomhang", System.Data.CommandType.StoredProcedure);
                DataRow newRow = dt_nhomhang2.NewRow();
                newRow["manhomhang"] = "==chon nhom hang==";
                dt_nhomhang2.Rows.InsertAt(newRow, 0);
                dr_nhomhang2.DataSource = dt_nhomhang2;
                dr_nhomhang2.DataBind();
            }
               
        }

        protected void btnDownloadClick(Object sender, EventArgs e)
        {
            try
            {
                string fileName = "mauupload_hanghoa.xlsx";
                string fileExtension = ".xlsx";

                // Set Response.ContentType
                Response.ContentType = GetContentType(fileExtension);

                // Append header
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);

                // Write the file to the Response
                Response.TransmitFile(Server.MapPath("~/Textfile/" + fileName));
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

        //public void Download_Click(object sender, EventArgs e)
        //{
        //    DataTable dt_dowload = new DataTable();
        //    dt_dowload = DataConn.StoreFillDS("NH_danhmuchanghoa", System.Data.CommandType.StoredProcedure);          

        //    System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.AddHeader("content-disposition", "attachment;filename=Danhmuchanghoa.xls");
        //    Response.Charset = "";
        //    //Response.ContentType = "application/ms-excel";
        //    Response.ContentType = "application/vnd.ms-excel"; // Thay đổi kiểu nội dung

        //    //System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
        //    //response.Clear();
        //    //response.Buffer = true;
        //    //response.Charset = "";
        //    //response.ContentType = "text/csv";
        //    //response.AddHeader("Content-Disposition", "attachment;filename=myfilename.csv");

        //    if (dt_dowload != null)
        //    {
        //        // Thêm thẻ meta để chỉ định mã hóa UTF-8
        //        //Response.Write("<meta http-equiv=\"content-type\" content=\"application/vnd.ms-excel; charset=UTF-8\">");

        //        foreach (DataColumn dc in dt_dowload.Columns)
        //        {
        //            Response.Write(dc.ColumnName + "\t");

        //        }
        //        Response.Write(System.Environment.NewLine);
        //        foreach (DataRow dr in dt_dowload.Rows)
        //        {
        //            for (int i = 0; i < dt_dowload.Columns.Count; i++)
        //            {
        //                // Mã hóa dữ liệu thành UTF-8
        //                //Response.Write(HttpUtility.HtmlEncode(dr[i].ToString()) + "\t");
        //                //Response.Write(dr[i].ToString() + "\t");
        //                //byte[] bytes = Encoding.Default.GetBytes(dr[i].ToString());
        //                //string utf8EncodedString = Encoding.UTF8.GetString(bytes);
        //                //Response.Write(utf8EncodedString + "\t");

        //                byte[] utf8Bytes = Encoding.UTF8.GetBytes(dr[i].ToString());
        //                string utf8EncodedString = Encoding.UTF8.GetString(utf8Bytes);
        //                Response.Write(utf8EncodedString + "\t");
        //            }
        //            Response.Write("\n");
        //        }
        //    }
        //    Response.End();  //must this sentence
        //}

        protected void btnExport_Click(object sender, EventArgs e)
        {          
            DataTable dataTable = new DataTable();
            dataTable = DataConn.StoreFillDS("NH_danhmuchanghoa", System.Data.CommandType.StoredProcedure);

            // Tạo một tệp Excel mới
            string fileName = "ExportedData_" + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";
            string filePath = Server.MapPath("~/Dowloads/" + fileName);

            // Tạo nội dung XML cho tệp Excel
            string excelContent = "<table><tr><th>ID</th>" +
                "<th>mahang</th>" +
                "<th>tenhang</th>" +
                "<th>soluongton</th>" +
                "<th>gianhap</th>" +
                "<th>giaban</th>" +
                "<th>tennhomhang</th>" +               
                "</tr>";
            foreach (DataRow row in dataTable.Rows)
            {
                excelContent += "<tr>" +
                    "<td>" + row["id"].ToString() + "</td>" +
                    "<td>" + row["mahang"].ToString() + "</td>" +
                    "<td>" + row["tenhang"].ToString() + "</td>" +
                    "<td>" + row["soluongton"].ToString() + "</td>" +
                    "<td>" + row["gianhap"].ToString() + "</td>" +
                    "<td>" + row["giaban"].ToString() + "</td>" +
                    "<td>" + row["tennhomhang"].ToString() + "</td>" +
                    "</tr>";
            }
            excelContent += "</table>";

            // Lưu nội dung XML vào tệp Excel  // khong can luu
            File.WriteAllText(filePath, excelContent);

            // Tải tệp Excel xuống
            Response.Clear();
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;  filename=" + fileName);
            Response.WriteFile(filePath);
            Response.End();
        }

        protected void ImportFromExcel(object sender, EventArgs e)
        {
            // CHECK IF A FILE HAS BEEN SELECTED.
            if ((FileUpload.HasFile))
            {

                if (!Convert.IsDBNull(FileUpload.PostedFile) &
                    FileUpload.PostedFile.ContentLength > 0)
                {
                    //tam thoi rao cho nay lai. them moi thi update  ==> xoa het xu dung lenh nay
                    //DataConn.Execute_NonSQL("truncate table [FREE_LOCATION].[dbo].[DM_Mater_Reability];");

                    //FIRST, SAVE THE SELECTED FILE IN THE ROOT DIRECTORY.
                    FileUpload.SaveAs(Server.MapPath(".") + "\\" + FileUpload.FileName);

                    SqlBulkCopy oSqlBulk = null;

                    // SET A CONNECTION WITH THE EXCEL FILE.
                    OleDbConnection myExcelConn = new OleDbConnection
                        ("Provider=Microsoft.ACE.OLEDB.12.0; " +
                            "Data Source=" + Server.MapPath(".") + "\\" + FileUpload.FileName +
                            ";Extended Properties=Excel 12.0;");
                    try
                    {
                        myExcelConn.Open();

                        // GET DATA FROM EXCEL SHEET.
                        OleDbCommand objOleDB =
                            new OleDbCommand("SELECT *FROM [Sheet1$]", myExcelConn);

                        // READ THE DATA EXTRACTED FROM THE EXCEL FILE.
                        OleDbDataReader objBulkReader = null;
                        objBulkReader = objOleDB.ExecuteReader();

                        // SET THE CONNECTION STRING.
                        //string sCon = "Data Source=10.92.186.30;Persist Security Info=False;" +
                        //    "Initial Catalog=FREE_LOCATION;User Id=sa;Password=Psnvdb2013;" +
                        //    "Connect Timeout=30;";  

                        string sCon = "Data Source=./;Persist Security Info=False;" +
                           "Initial Catalog=Warehouse_BPS;User Id=sa;Password='';" +
                           "Connect Timeout=30;";

                        //string sCon = "Data Source=10.92.186.30;Persist Security Info=False;" +
                        //   "Initial Catalog=Warehouse_BPS;User Id=sa;Password=Psnvdb2013;" +
                        //   "Connect Timeout=30;";


                        using (SqlConnection con = new SqlConnection(sCon))
                        {
                            con.Open();
                            // FINALLY, LOAD DATA INTO THE DATABASE TABLE.
                            oSqlBulk = new SqlBulkCopy(con);
                            oSqlBulk.DestinationTableName = "hthanghoa"; // TABLE NAME.
                            oSqlBulk.WriteToServer(objBulkReader);
                        }

                        lblConfirm.Text = "DATA IMPORTED SUCCESSFULLY.";
                        lblConfirm.Attributes.Add("style", "color:green");
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Thành công!');", true);

                        //File.Delete(Server.MapPath(".") + "\\" + FileUpload.FileName); // DELETE THE FILE upload len.

                        //load grid
                        dt_hanghoa = DataConn.StoreFillDS("NH_danhmuchanghoa", System.Data.CommandType.StoredProcedure);
                        //LoadData();
                    }
                    catch (Exception ex)
                    {
                        lblConfirm.Text = ex.Message;
                        lblConfirm.Attributes.Add("style", "color:red");
                    }
                    finally
                    {
                        // CLEAR.
                        oSqlBulk.Close();
                        oSqlBulk = null;
                        myExcelConn.Close();
                        myExcelConn = null;
                    }
                }
            }
        }

        public void updatehanghoa(object sender, EventArgs e)
        {            
            string mahang = txtmahang.Text;
            string tenhang = txttenhang.Text;
            string dvt = txtdovitinh.Text;
            string gianhap = txtgianhap.Text;
            string giaban = txtgiaban.Text;
            string nhomhangid = dr_nhomhang2.Text;

            DataTable dtupdate = new DataTable();
            dtupdate = DataConn.StoreFillDS("NH_Update_hanghoa", System.Data.CommandType.StoredProcedure, mahang, tenhang, dvt, gianhap, giaban, nhomhangid);
            if (dtupdate.Rows[0][0].ToString() == "1")
            {
                dt_hanghoa = DataConn.StoreFillDS("NH_danhmuchanghoa", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, kiểm tra lại thông tin!'); ", true);
            }
         
        }

        public void themhanghoa(object sender, EventArgs e)
        {
            string mahang = mahangid.Text;
            string tenhang = tenhangid.Text;
            string dvt = dvtid.Text;
            string gianhap = gianhapid.Text;
            string giaban = giabanid.Text;
            string nhomhangid = dr_nhomhang.Text;

            DataTable dtinsert = new DataTable();
            dtinsert = DataConn.StoreFillDS("NH_insert_hanghoa", System.Data.CommandType.StoredProcedure, mahang, tenhang, dvt, gianhap, giaban, nhomhangid);
            if (dtinsert.Rows[0][0].ToString() == "1")
            {
                dt_hanghoa = DataConn.StoreFillDS("NH_danhmuchanghoa", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, kiểm tra lại thông tin!'); ", true);
            }

        }
    }
}