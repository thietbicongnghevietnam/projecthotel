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

namespace WebApplication1
{
    public partial class Phieuthu : System.Web.UI.Page
    {
        public DataTable dtncc = new DataTable();
        public DataTable dt_getSohd = new DataTable();
        public string sohoadon = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dtncc = DataConn.StoreFillDS("NH_Get_KH", System.Data.CommandType.StoredProcedure);
                DataRow newRow2 = dtncc.NewRow();
                newRow2["makh"] = "==KH==";
                dtncc.Rows.InsertAt(newRow2, 0);
                dr_nhacungcap.DataSource = dtncc;
                dr_nhacungcap.DataBind();

                dt_getSohd = DataConn.StoreFillDS("NH_getsohoadon_PT", System.Data.CommandType.StoredProcedure);
                sohoadon = dt_getSohd.Rows[0][0].ToString();
            }
            
        }

        [WebMethod]
        public static string NH_Phieuthu(string guoinhan, string nhacc, string sotien, string conoid, string motaid, string ngaychi, string phuongthuc, string nguoichitienid)
        {
            String thongbao = "";
            DataTable dtsave = new DataTable();

            dtsave = DataConn.StoreFillDS("NH_Phieuchi_Phieuthu2", System.Data.CommandType.StoredProcedure, guoinhan, nhacc, sotien, conoid, motaid, ngaychi, phuongthuc, nguoichitienid);

            if (dtsave.Rows[0][0].ToString() == "1")
            {
                //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();

                thongbao = "OK" + "," + dtsave.Rows[0][1].ToString();
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;
        }

        [WebMethod]
        public static string NH_getcongno(string idcongno)
        {
            String thongbao = "";
            DataTable dtsave = new DataTable();
            String type_cono = "phieuthu";

            dtsave = DataConn.StoreFillDS("NH_getcongno", System.Data.CommandType.StoredProcedure, idcongno, type_cono);

            if (dtsave.Rows.Count > 0)
            {
                //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();

                thongbao = dtsave.Rows[0][0].ToString();
            }
            else
            {
                thongbao = "NG";
            }
            return thongbao;
        }

    }
}