using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WebApplication1.App_Code;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.IO;

namespace WebApplication1.Danhmuc
{
    public partial class Danhmucnhomhang : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_nhomhang = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt_nhomhang = DataConn.StoreFillDS("NH_danhmucnhomhang", System.Data.CommandType.StoredProcedure);
            }
        }

        public void themkhuvuc(object sender, EventArgs e)
        {
            string makhuvuc = khuvucid.Text;
            string tenkhuvuc = tenkhuvucid.Text;

            DataTable dtinsert = new DataTable();
            dtinsert = DataConn.StoreFillDS("NH_insert_nhomhang", System.Data.CommandType.StoredProcedure, makhuvuc, tenkhuvuc);
            if (dtinsert.Rows[0][0].ToString() == "1")
            {
                dt_nhomhang = DataConn.StoreFillDS("NH_danhmucnhomhang", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, kiểm tra lại thông tin!'); ", true);
            }

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

                        //string sCon = "Data Source=./;Persist Security Info=False;" +
                        //   "Initial Catalog=Warehouse_BPS;User Id=sa;Password='';" +
                        //   "Connect Timeout=30;";

                        string sCon = GetConnectStringFromFile() + ";Connect Timeout=30;";

                        // using (SqlConnection conn = new SqlConnection(GetConnectStringFromFile()))
                        using (SqlConnection con = new SqlConnection(sCon))
                        {
                            con.Open();
                            // FINALLY, LOAD DATA INTO THE DATABASE TABLE.
                            oSqlBulk = new SqlBulkCopy(con);
                            oSqlBulk.DestinationTableName = "htnhomhang"; // TABLE NAME.
                            oSqlBulk.WriteToServer(objBulkReader);
                        }

                        lblConfirm.Text = "DATA IMPORTED SUCCESSFULLY.";
                        lblConfirm.Attributes.Add("style", "color:green");
                        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Thành công!');", true);

                        //File.Delete(Server.MapPath(".") + "\\" + FileUpload.FileName); // DELETE THE FILE upload len.

                        //load grid
                        dt_nhomhang = DataConn.StoreFillDS("NH_danhmucnhomhang", System.Data.CommandType.StoredProcedure);
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

        protected void btnDownloadClick(Object sender, EventArgs e)
        {
            try
            {
                string fileName = "mauupload_nhomhang.xlsx";
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

        public static string GetConnectStringFromFile()
        {
            //string line = @"Data Source=192.168.128.1;Initial Catalog=Tally_Sheet;Persist Security Info=True;User ID=sa;Password=Psnvdb2013";
            string filePath = HttpContext.Current.Server.MapPath("~/scnn.ini");
            string line;
            try
            {
                //using (StreamReader sr = new StreamReader("scnn.ini"))
                //{
                //    line = sr.ReadToEnd();
                //}
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

        public void updatekhuvuc(object sender, EventArgs e)
        {
            string tenkhuvuc = txttenkhuvuc.Text;
            string makhuvuc = txtmakhuvuc.Text;

            DataTable dtupdate = new DataTable();
            dtupdate = DataConn.StoreFillDS("NH_Update_nhomhang", System.Data.CommandType.StoredProcedure, makhuvuc, tenkhuvuc);
            if (dtupdate.Rows[0][0].ToString() == "1")
            {
                dt_nhomhang = DataConn.StoreFillDS("NH_danhmucnhomhang", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, kiểm tra lại thông tin!'); ", true);
            }

        }

        public void Download_Click(object sender, EventArgs e)
        {
            DataTable dt_dowload = new DataTable();
            dt_dowload = DataConn.StoreFillDS("NH_danhmucnhomhang", System.Data.CommandType.StoredProcedure);


            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Danhmucnhomhang.xls");
            Response.Charset = "";
            Response.ContentType = "application/ms-excel";

            //System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            //response.Clear();
            //response.Buffer = true;
            //response.Charset = "";
            //response.ContentType = "text/csv";
            //response.AddHeader("Content-Disposition", "attachment;filename=myfilename.csv");

            if (dt_dowload != null)
            {
                foreach (DataColumn dc in dt_dowload.Columns)
                {
                    Response.Write(dc.ColumnName + "\t");

                }
                Response.Write(System.Environment.NewLine);
                foreach (DataRow dr in dt_dowload.Rows)
                {
                    for (int i = 0; i < dt_dowload.Columns.Count; i++)
                    {
                        Response.Write(dr[i].ToString() + "\t");
                    }
                    Response.Write("\n");
                }
            }
            Response.End();  //must this sentence
        }


    }
}