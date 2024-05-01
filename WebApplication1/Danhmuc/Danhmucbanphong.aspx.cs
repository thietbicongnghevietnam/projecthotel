using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using WebApplication1.App_Code;
using System.Web.Services;
using Newtonsoft.Json.Linq;
using System.Web.Script.Serialization;

namespace WebApplication1.Danhmuc
{
    public partial class Danhmucbanphong : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_banphong = new DataTable();
        public DataTable dt_khuvuc = new DataTable();
        public DataTable dt_khuvuc1 = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt_khuvuc = DataConn.StoreFillDS("NH_Get_Khuvuc", System.Data.CommandType.StoredProcedure);
                DataRow newRow2 = dt_khuvuc.NewRow();
                newRow2["tenkhuvuc"] = "==KV==";
                dt_khuvuc.Rows.InsertAt(newRow2, 0);
                dr_khuvuc.DataSource = dt_khuvuc;
                dr_khuvuc.DataBind();

                dt_khuvuc1 = DataConn.StoreFillDS("NH_Get_Khuvuc", System.Data.CommandType.StoredProcedure);
                DataRow newRow = dt_khuvuc1.NewRow();
                newRow2["tenkhuvuc"] = "==KV==";
                dt_khuvuc1.Rows.InsertAt(newRow, 0);
                dr_filter_cate.DataSource = dt_khuvuc1;
                dr_filter_cate.DataBind();

                dt_banphong = DataConn.StoreFillDS("NH_danhmucbanphong", System.Data.CommandType.StoredProcedure);
            }              
        }
        protected void Addnew_Click(object sender, EventArgs e)
        {
            string tenbanphong = banphongid.Value.ToString();
            string khuvucid = dr_filter_cate.Text;
            DataTable dtupdate = new DataTable();
            dtupdate = DataConn.StoreFillDS("NH_addnew_phongban", System.Data.CommandType.StoredProcedure, tenbanphong, khuvucid);
            if (dtupdate.Rows[0][0].ToString() == "1")
            {
                dt_banphong = DataConn.StoreFillDS("NH_danhmucbanphong", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, kiểm tra lại thông tin!'); ", true);
            }

        }
        public void updatebanphong(object sender, EventArgs e)
        {
            //string userid = txtuserid.Text.ToString();

            //string _sohd = txtsohoadon.Text.ToString();
            //string _ngaymuon = Request.Form[txtngaymuon.UniqueID];//txtngaymuon.Text.ToString();
            //string _ngaytra = Request.Form[txtngaytra.UniqueID];// txtngaytra.Text.ToString();
            string banphongid = txttenphong.Text;
            string khuvucid = dr_khuvuc.Text;
            
            DataTable dtupdate = new DataTable();
            dtupdate = DataConn.StoreFillDS("NH_Update_phongban", System.Data.CommandType.StoredProcedure, banphongid, khuvucid);
            if (dtupdate.Rows[0][0].ToString() == "1")
            {
                dt_banphong = DataConn.StoreFillDS("NH_danhmucbanphong", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, kiểm tra lại thông tin!'); ", true);
            }

            //if (userid == "")
            //{
            //    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, user does not input infor!'); ", true);
            //}
            // else
            //{
            //check user co trong bang user khong?
            //dtuser = DataConn.StoreFillDS("Get_userPSNV", System.Data.CommandType.StoredProcedure, userid);
            //if (dtuser.Rows[0][0].ToString() == "1")
            //{
            //    ////user eixsts mater
            //    dt5 = DataConn.StoreFillDS("Update_order_thietbi", System.Data.CommandType.StoredProcedure, itemorder, userid, lydo, bophan, ngaymuon, ngaytra);
            //    if (dt5.Rows[0][0].ToString() == "1")
            //    {
            //        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            //        dt = DataConn.StoreFillDS("Get_mater_device_borrow", System.Data.CommandType.StoredProcedure);
            //        txtuserid.Text = "";
            //    }
            //    else
            //    {
            //        Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, You do not Order!'); ", true);
            //        txtuserid.Text = "";
            //    }
            //}
            //else
            //{
            //    //user not eixsts
            //    Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, user does not exists!'); ", true);
            //    txtuserid.Text = "";
            //}
            //}


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


    }
}