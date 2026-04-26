using QRCoder;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.Services;
using WebApplication1.App_Code;

namespace WebApplication1
{
    public partial class OrderNhanVien : System.Web.UI.Page
    {
        public DataTable dt_nhomhang = new DataTable();
        public DataTable dt_listhanghoa = new DataTable();

        public DataTable dt_khuvuc = new DataTable();
        public DataTable dt_ban = new DataTable();
        //public String tenkhuvuc = "";

        //thong tin don vi
        public string tendovi = "";
        public string diachidonvi = "";
        public string sodtdonvi = "";
        public string sodtdonvi2 = "";
        public string sodtdonvi3 = "";
        public string ghichu = "";
        public DataTable dtdonvi = new DataTable();
        public string barcodeData = "";
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
                dtdonvi = DataConn.StoreFillDS("NH_thongtin_doanhnghiep", System.Data.CommandType.StoredProcedure);
                tendovi = dtdonvi.Rows[0][1].ToString();
                diachidonvi = dtdonvi.Rows[0][5].ToString();
                sodtdonvi = dtdonvi.Rows[0][7].ToString();
                sodtdonvi2 = dtdonvi.Rows[0][8].ToString();
                sodtdonvi3 = dtdonvi.Rows[0][9].ToString();
                ghichu = dtdonvi.Rows[0][10].ToString();

                GenerateAndConvertQRCode(ghichu);
            }
        }

        private void GenerateAndConvertQRCode(string data)
        {
            // Tạo mã QR từ dữ liệu được chuyển đến
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            //QRCodeData qrCodeData = qrGenerator.CreateQrCode(data, QRCodeGenerator.ECCLevel.Q);
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(data, QRCodeGenerator.ECCLevel.L);
            QRCode qrCode = new QRCode(qrCodeData);
            Bitmap qrCodeImage = qrCode.GetGraphic(2); // Điều chỉnh kích thước ở đây nếu cần

            // Chuyển đổi hình ảnh Bitmap thành một dạng dữ liệu base64
            using (MemoryStream memoryStream = new MemoryStream())
            {
                qrCodeImage.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Png);
                byte[] byteImage = memoryStream.ToArray();
                barcodeData = "data:image/png;base64," + Convert.ToBase64String(byteImage);
            }
        }

        //private void LoadKhuVuc()
        //{
        //    DataTable dt = DataConn.StoreFillDS("SP_LoadKhuVuc",CommandType.StoredProcedure);

        //    khuvucid.DataSource = dt;
        //    khuvucid.DataTextField = "tenkhuvuc";
        //    khuvucid.DataValueField = "makhuvuc"; // hoặc id tùy bạn
        //    khuvucid.DataBind();
        //}

        //private void LoadBan()
        //{
        //    DataTable dt = DataConn.StoreFillDS("SP_LoadBan",CommandType.StoredProcedure);

        //    tenban123.DataSource = dt;
        //    tenban123.DataTextField = "tenphong";
        //    tenban123.DataValueField = "id";
        //    tenban123.DataBind();
        //}

        [System.Web.Services.WebMethod]
        public static string GetHangHoa(string nhomhangid)
        {
            System.Data.DataTable dt;

            if (!string.IsNullOrEmpty(nhomhangid))
            {
                dt = DataConn.StoreFillDS("NH_select_hanghoa",CommandType.StoredProcedure, nhomhangid);
            }
            else
            {
                dt = DataConn.StoreFillDS("NH_select_hanghoa",CommandType.StoredProcedure,"");
            }

            string html = "";

            foreach (System.Data.DataRow rows1 in dt.Rows)
            {
                html += @"
                <div class='col-6 col-sm-4 col-md-3 mb-3 d-flex'>
                    <div class='card menu-card w-100'>
                        <div class='card-body'>
                            <div class='row'>
                                <div class='col-8'>
                                    <div class='menu-title'>
                                        <mh>" + rows1["tenhang"] + @"</mh>
                                    </div>
                                    <div class='text-muted'>
                                        <dg>" + rows1["giaban"] + @"</dg> VNĐ
                                    </div>
                                </div>
                                <div class='col-4 text-center'>
                                    <img src='" + rows1["anh"] + @"' />
                                </div>
                            </div>
                        </div>

                        <div class='card-footer text-center'>
                            <input type='number' name='quantity' id='quantity'
                                   class='quantity form-control text-center'
                                   value='1'
                                   min='1'
                                   style='width:60px;height:30px;float:left;' />
                            
                            <a href='#'class='btn btn-sm btn-primary button_addmenu'>
                                 <i class='fa fa-plus - square'></i>Add
                              </a>
                        </div>
                    </div>
                </div>";
            }

            return html;
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

        [WebMethod]
        public static string GetAllTrangThai()
        {
            DataTable dt = DataConn.StoreFillDS("SP_GetAllTrangThaiBan",
                CommandType.StoredProcedure);

            return DataTableToJson(dt);
        }

        [WebMethod]
        public static string UpdateIsPrinted(string tenphong)
        {
            try
            {
                string sql = "UPDATE htsocai SET IsPrinted = 1 WHERE tenphong = @TenPhong AND IsPrinted = 0 and Flag = 0";

                SqlParameter[] pr = new SqlParameter[]
                {
            new SqlParameter("@TenPhong", tenphong)
                };

                DataConn.ExecuteNonQuery(sql, pr);
                return "OK";
            }
            catch (Exception ex)
            {
                return "ERROR: " + ex.Message;
            }
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