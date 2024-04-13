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


using System.Drawing;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace WebApplication1
{
    public partial class Phieuchi : System.Web.UI.Page
    {
        public DataTable dtncc = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindStockCode();
                //dtncc = DataConn.StoreFillDS("NH_Get_NCC", System.Data.CommandType.StoredProcedure);
                //DataRow newRow2 = dtncc.NewRow();
                //newRow2["mancc"] = "==NCC==";
                //dtncc.Rows.InsertAt(newRow2, 0);
                //dr_nhacungcap.DataSource = dtncc;
                //dr_nhacungcap.DataBind();
            }
        }

       


    }
}