using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using WebApplication1.App_Code;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Text;
using System.IO;
using System.Data;

namespace WebApplication1.Danhmuc
{
    public partial class Danhmucdonvi : System.Web.UI.Page
    {
        DataConn cnn = new DataConn();
        public DataTable dt_donvi = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dt_donvi = DataConn.StoreFillDS("NH_thongtin_doanhnghiep", System.Data.CommandType.StoredProcedure);
            }
        }

        public void themhanghoa(object sender, EventArgs e)
        {
            string tenid_ = tenid.Text;
            string quanlyid_ = quanlyid.Text;
            string masothueid_ = masothueid.Text;
            string faxid_ = faxid.Text;
            string diachi1id_ = diachi1id.Text;
            string diachi2id_ = diachi2id.Text;
            string dienthoai1id_ = dienthoai1id.Text;
            string dienthoai2id_ = dienthoai2id.Text;
            string ghichuid_ = ghichuid.Text;

            DataTable dtinsert = new DataTable();
            dtinsert = DataConn.StoreFillDS("NH_insert_thongtindoanhnghiep", System.Data.CommandType.StoredProcedure, tenid_, quanlyid_, masothueid_, faxid_, diachi1id_, diachi2id_, dienthoai1id_, dienthoai2id_, ghichuid_);
            if (dtinsert.Rows[0][0].ToString() == "1")
            {
                dt_donvi = DataConn.StoreFillDS("NH_thongtin_doanhnghiep", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, kiểm tra lại thông tin!'); ", true);
            }

        }

        public void updatehanghoa(object sender, EventArgs e)
        {
            string id = txtid.Text;
            string Tendoanhnghiep = txtdoanhnghiep.Text;
            string NguoiQuanly = txtquanly.Text;
            string Masothue = txtmasothue.Text;
            string Fax = txtFax.Text;
            string Diachi1 = txtdiachi1.Text;
            string Diachi2 = txtdiachi2.Text;
            string Sodt1 = txtsodt1.Text;
            string Sodt2 = txtsodt2.Text;
            string ghichu = txtghichu.Text;

            DataTable dtupdate = new DataTable();
            dtupdate = DataConn.StoreFillDS("NH_Update_doanhnghiep", System.Data.CommandType.StoredProcedure, id, Tendoanhnghiep, NguoiQuanly, Masothue, Fax, Diachi1, Diachi2, Sodt1, Sodt2, ghichu);
            if (dtupdate.Rows[0][0].ToString() == "1")
            {
                dt_donvi = DataConn.StoreFillDS("NH_thongtin_doanhnghiep", System.Data.CommandType.StoredProcedure);
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.success('Success!!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message", "toastr.error('NG, kiểm tra lại thông tin!'); ", true);
            }

        }


    }
}