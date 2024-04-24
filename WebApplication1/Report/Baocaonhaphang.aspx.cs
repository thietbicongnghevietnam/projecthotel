using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using WebApplication1.App_Code;

namespace WebApplication1.Report
{
    public partial class Baocaonhaphang : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_BCNH = new DataTable();
        //public DataTable dt1 = new DataTable();
        public DataTable dtcate = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt_BCNH = DataConn.StoreFillDS("NH_BaocaoNH", System.Data.CommandType.StoredProcedure);
            }
        }
        public void BtnOrderItem(object sender, EventArgs e)
        {
            string userid = txtuserid.Text.ToString();

            string _sohd = txtsohoadon.Text.ToString();
            string _ngaymuon = Request.Form[txtngaymuon.UniqueID];//txtngaymuon.Text.ToString();
            string _ngaytra = Request.Form[txtngaytra.UniqueID];// txtngaytra.Text.ToString();
            string nam = _ngaymuon.Substring(6, 4);
            string thang = _ngaymuon.Substring(3, 2);
            string ngay = _ngaymuon.Substring(0, 2);
            string ngaymuon = nam + "-" + thang + "-" + ngay;

            string _nam = _ngaytra.Substring(6, 4);
            string _thang = _ngaytra.Substring(3, 2);
            string _ngay = _ngaytra.Substring(0, 2);
            string ngaytra = _nam + "-" + _thang + "-" + _ngay;

            DataTable dt5 = new DataTable();
            DataTable dtuser = new DataTable();
            if (userid == "")
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, user does not input infor!'); ", true);
            }
            else
            {
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
            }


        }

            //protected void filter_cate_Change(object sender, EventArgs e)
            //{
            //    string _cate = dr_filter_cate.Text;
            //    dt_history = DataConn.StoreFillDS("Get_history_device_borrow_cate", System.Data.CommandType.StoredProcedure, _cate);
            //}

            //public void Download_Click2(object sender, EventArgs e)
            //{
            //    string _itemid = itemid.Value.ToString();
            //    Response.Redirect("ReportBorrowReturn.aspx?itemid='" + _itemid + "' ");
            //}

        protected void Search_Date_Click(object sender, EventArgs e)
        {
            //string _date = Request.Form[datepicker.UniqueID];
            string _fromdate = Request.Form[Date1.UniqueID];
            string _todate = Request.Form[ngaychiid.UniqueID];
            

            //string _todate = Request.Form[ngaychiid.UniqueID];

            string _checkpartno = Request.Form["check_partno_search"];
            string _partno = partno_search.Value.ToString();
            //filter_type.Text = "";

            if (_checkpartno == "on")
            {
                //loc theo ma
                //string nam = _date.Substring(6, 4);
                //string thang = _date.Substring(3, 2);
                //string ngay = _date.Substring(0, 2);
                //string _date2 = nam + "-" + thang + "-" + ngay;

                dt_BCNH = DataConn.StoreFillDS("NH_BaocaoNH", System.Data.CommandType.StoredProcedure);
                //datepicker.Value = ngay + "-" + thang + "-" + nam;

            }
            else
            {
                //loc theo ngay
                if (_fromdate == "")
                {
                    dt_BCNH = DataConn.StoreFillDS("NH_BaocaoNH", System.Data.CommandType.StoredProcedure);
                }
                else
                {
                    //string nam = _date.Substring(6, 4);
                    //string thang = _date.Substring(3, 2);
                    //string ngay = _date.Substring(0, 2);
                    //string _date2 = nam + "-" + thang + "-" + ngay;

                    ////string _cate = dr_filter_cate.Text;
                    //string typefilter = "all";



                    dt_BCNH = DataConn.StoreFillDS("NH_BaocaoNH_theongay", System.Data.CommandType.StoredProcedure, _fromdate, _todate);
                    //datepicker.Value = ngay + "-" + thang + "-" + nam;
                }
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




    }
}