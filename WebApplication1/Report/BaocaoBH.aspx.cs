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

namespace WebApplication1.Report
{
    public partial class BaocaoBH : System.Web.UI.Page
    {
        public DataTable dtbaocaobanhang = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
            }

            dtbaocaobanhang = DataConn.StoreFillDS("NH_BaocaoBH", System.Data.CommandType.StoredProcedure);           

        }

        public void BtnOrderItem(object sender, EventArgs e)
        {
            string userid = txtuserid.Text.ToString();
            string _sohd = txtsohoadon.Text.ToString();
            string _ngaymuon = Request.Form[txtngaymuon.UniqueID];//txtngaymuon.Text.ToString();
            string _ngaytra = Request.Form[txtngaytra.UniqueID];// txtngaytra.Text.ToString();

            DataTable dt5 = new DataTable();
            DataTable dtuser = new DataTable();
            if (userid == "")
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, user does not input infor!'); ", true);
            }
            else
            {
            }
        }

            protected void Search_Date_Click2(object sender, EventArgs e)
        {
            string _date = Request.Form[ngaychiid.UniqueID];
            string _checkpartno = Request.Form["check_partno_search"];
            string _partno = partno_search.Value.ToString();
            //filter_type.Text = "";

            if (_checkpartno == "on")
            {
                //loc theo ma
                string nam = _date.Substring(6, 4);
                string thang = _date.Substring(3, 2);
                string ngay = _date.Substring(0, 2);
                string _date2 = nam + "-" + thang + "-" + ngay;

                dtbaocaobanhang = DataConn.StoreFillDS("NH_BaocaoBH", System.Data.CommandType.StoredProcedure);
                ngaychiid.Value = ngay + "-" + thang + "-" + nam;

            }
            else
            {
                //loc theo ngay
                if (_date == "")
                {
                    dtbaocaobanhang = DataConn.StoreFillDS("NH_BaocaoBH", System.Data.CommandType.StoredProcedure);
                }
                else
                {
                    string nam = _date.Substring(6, 4);
                    string thang = _date.Substring(3, 2);
                    string ngay = _date.Substring(0, 2);
                    string _date2 = nam + "-" + thang + "-" + ngay;

                    //string _cate = dr_filter_cate.Text;
                    //string typefilter = "all";



                    dtbaocaobanhang = DataConn.StoreFillDS("NH_BaocaoBH", System.Data.CommandType.StoredProcedure);
                    ngaychiid.Value = ngay + "-" + thang + "-" + nam;
                }
            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //string ngayid = ngaychiid.Text;
        //}



    }
}