﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WebApplication1.App_Code;

namespace WebApplication1.Danhmuc
{
    public partial class DMcauthanhDVT : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_dvt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt_dvt = DataConn.StoreFillDS("NH_DMCauthanhDVT", System.Data.CommandType.StoredProcedure);
            }
        }

        public void themkhuvuc(object sender, EventArgs e)
        {
            //string id = txtid.Text;
            string mahang = mahangid.Text;
            string donvito = dvtoid.Text;
            string soluongquydoi = slquydoiid.Text;
            string donvinho = dvnhoid.Text;

            DataTable dtinsert = new DataTable();
            dtinsert = DataConn.StoreFillDS("NH_insert_cauthanhdvt", System.Data.CommandType.StoredProcedure, mahang, donvito, soluongquydoi, donvinho);
            if (dtinsert.Rows[0][0].ToString() == "1")
            {
                dt_dvt = DataConn.StoreFillDS("NH_DMCauthanhDVT", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, Đã tồn tại thông tin!'); ", true);
            }

        }

        public void updatekhuvuc(object sender, EventArgs e)
        {
            string id = txtid.Text;
            string mahang = txtmahang.Text;
            string donvito = txtto.Text;
            string soluongquydoi = txtquydoi.Text;
            string donvinho = txtnho.Text;

            DataTable dtupdate = new DataTable();
            dtupdate = DataConn.StoreFillDS("NH_update_cauthanhdvt", System.Data.CommandType.StoredProcedure, id, mahang, donvito, soluongquydoi, donvinho);
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

        public void Download_Click(object sender, EventArgs e)
        {
            DataTable dt_dowload = new DataTable();
            dt_dowload = DataConn.StoreFillDS("NH_DMCauthanhDVT", System.Data.CommandType.StoredProcedure);

            System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Danhmucnhanvien.xls");
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