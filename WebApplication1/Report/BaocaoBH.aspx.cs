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

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    //string ngayid = ngaychiid.Text;
        //}



    }
}