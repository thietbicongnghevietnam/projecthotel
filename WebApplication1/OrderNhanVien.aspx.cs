using System;

using System.Data;
using WebApplication1.App_Code;
using System.Web.Services;

namespace WebApplication1
{
    public partial class OrderNhanVien : System.Web.UI.Page
    {
        public DataTable dt_nhomhang = new DataTable();
        public DataTable dt_listhanghoa = new DataTable();

        public DataTable dt_khuvuc = new DataTable();
        public DataTable dt_ban = new DataTable();
        //public String tenkhuvuc = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            dt_nhomhang = DataConn.StoreFillDS("NH_select_nhomhang", CommandType.StoredProcedure);            
            //tenkhuvuc = "";
            //dt_ban = DataConn.StoreFillDS("NH_select_banorder", System.Data.CommandType.StoredProcedure, tenkhuvuc);          
            //DataRow newRow2 = dt_ban.NewRow();
            //newRow2["tenphong"] = "==ChonBan==";
            //dt_ban.Rows.InsertAt(newRow2, 0);
            //dr_banphong.DataSource = dt_ban;
            //dr_banphong.DataBind();


            if (!IsPostBack)
            {
                string nhomhangid = Request.QueryString["nhomhangid"];               
                //DataRow newRow3 = dt_khuvuc.NewRow();
                //newRow3["tenkhuvuc"] = "==ChonKV==";
                //dt_khuvuc.Rows.InsertAt(newRow3, 0);
                //dr_khuvuc.DataSource = dt_khuvuc;
                //dr_khuvuc.DataBind();

                if (nhomhangid != null)
                {
                    dt_listhanghoa = DataConn.StoreFillDS("NH_select_hanghoa", CommandType.StoredProcedure, nhomhangid);
                }
                else
                {
                    //all nhom hang
                    string _nhomhangid = "";
                    dt_listhanghoa = DataConn.StoreFillDS("NH_select_hanghoa", CommandType.StoredProcedure, _nhomhangid);
                }
            }

        }

        [WebMethod]
        public static string GetKhuvuc()
        {            
            DataTable dt = new DataTable();


            dt = DataConn.StoreFillDS("NH_select_khuvuc_order", System.Data.CommandType.StoredProcedure);

            return DataTableToJson(dt);
        }

        [WebMethod]
        public static string Getdanhsachban()
        {
            DataTable dt = new DataTable();
            string tenkhuvuc = "";
            dt = DataConn.StoreFillDS("NH_select_banorder", System.Data.CommandType.StoredProcedure, tenkhuvuc);
            return DataTableToJson(dt);
        }

        [WebMethod]
        public static string Gettenbanorder(string _tenban123)
        {
            DataTable dt = new DataTable();
            string tenkhuvuc = "";
            if (_tenban123 == "" || _tenban123 == "==KhuVuc==")
            {
                tenkhuvuc = "";
            }
            else
            {
                tenkhuvuc = _tenban123;
            }

            dt = DataConn.StoreFillDS("NH_select_banorder2", System.Data.CommandType.StoredProcedure, tenkhuvuc);

            return DataTableToJson(dt);
        }

        //protected void dr_khuvuc_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    // Lấy giá trị được chọn từ DropDownList

        //    string tenkhuvuc = dr_khuvuc.SelectedValue;
        //    dt_ban.Clear();

        //    dt_ban = DataConn.StoreFillDS("NH_select_banorder", System.Data.CommandType.StoredProcedure,tenkhuvuc);            
        //    dr_banphong.DataSource = dt_ban;
        //    dr_banphong.DataTextField = "tenphong"; 
        //    dr_banphong.DataValueField = "tenphong"; 
        //    dr_banphong.DataBind();

        //}

        //[WebMethod]
        //public static string Gettenbanorder(string khuvucid)
        //{
        //    string khuvucid_ = khuvucid;            

        //    DataTable dt = new DataTable();

        //    dt = DataConn.StoreFillDS("NH_select_banorder", System.Data.CommandType.StoredProcedure, khuvucid_);

        //    return DataTableToJson(dt);
        //}

        private static string DataTableToJson(DataTable dt)
        {
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>> rows = new System.Collections.Generic.List<System.Collections.Generic.Dictionary<string, object>>();
            foreach (DataRow dr in dt.Rows)
            {
                System.Collections.Generic.Dictionary<string, object> row = new System.Collections.Generic.Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }



    }
}