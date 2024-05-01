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

        public void Download_Click(object sender, EventArgs e)
        {
            DataTable dt_dowload = new DataTable();
            //if (dr_filter_cate.Text == "==select==")
            //{
            //    dt_dowload = DataConn.StoreFillDS("Get_history_device_borrow", CommandType.StoredProcedure);
            //}
            //else
            //{
            //    string _cate = dr_filter_cate.Text;
            //    dt_dowload = DataConn.StoreFillDS("Get_history_device_borrow_cate", System.Data.CommandType.StoredProcedure, _cate);
            //}


            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Baocao_lichsu_muon.xls");
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