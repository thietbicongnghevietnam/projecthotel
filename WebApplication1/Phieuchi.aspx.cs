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
    public partial class Phieuchi : System.Web.UI.Page
    {
        public DataTable dtncc = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                dtncc = DataConn.StoreFillDS("NH_Get_NCC", System.Data.CommandType.StoredProcedure);
                DataRow newRow2 = dtncc.NewRow();
                newRow2["mancc"] = "==NCC==";
                dtncc.Rows.InsertAt(newRow2, 0);
                dr_nhacungcap.DataSource = dtncc;
                dr_nhacungcap.DataBind();
            }

        }

        [WebMethod]
        public static string NH_Phieuchi(string guoinhan, string nhacc, string sotien, string conoid, string motaid, string ngaychi, string phuongthuc, string nguoichitienid)
        {
            String thongbao = "";
            DataTable dtsave = new DataTable();           

            dtsave = DataConn.StoreFillDS("NH_Phieuchi_Phieuthu", System.Data.CommandType.StoredProcedure, guoinhan, nhacc, sotien, conoid, motaid, ngaychi, phuongthuc, nguoichitienid);

            if (dtsave.Rows[0][0].ToString() == "1")
            {
                //thongbao = "OK" + "," + dtlevel.Rows[0][1].ToString();

                thongbao = "OK";
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
            String type_cono = "phieuchi";

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