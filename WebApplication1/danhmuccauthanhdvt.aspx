<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="danhmuccauthanhdvt.aspx.cs" Inherits="WebApplication1.danhmuccauthanhdvt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

    <link rel="stylesheet" href="../plugins/toastr/toastr.css" />
    <link rel="stylesheet" href="../dist/css/adminlte.min.css" />
    <link rel="stylesheet" href="../plugins/jquery-ui/jquery-ui.css" />

    <link rel="stylesheet" href="../content/bootstrap.css" />

    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../plugins/toastr/toastr.js"></script>

    <%--   <script src="../dist/Infra/jquery-3.7.0.js"></script>--%>
    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>

    <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">


    <div class="card">
        <div class="card-header">
            <h3>Danh mục cấu thành ĐVT</h3>                     
            <table id="dnhaphang" style="padding-bottom: 10px; padding-right: 10px; padding-top: 20px; padding-left: 20px;">
                <tr>
                    <td style="padding-bottom: 10px; padding-right: 10px;">Tên hàng :
                    <span id="mahanghoa" hidden></span>
                        <asp:TextBox ID="phieunhaphang" Style="float: left; width: 100%;" class="ajax form-control input-sm" value="" placeholder="Chọn tên hàng" runat="server"></asp:TextBox>
                    </td>
                    <td>
                         <span style="padding-left: 20px;"></span>
                        <button type="button" class="btn btn-primary" id="timkiemmahang" >  <%-- onserverclick="timkiemmahang" runat="server"--%>
                            Tìm kiếm
                        </button>
                    </td>
                    <td>
                         <span style="padding-left: 20px;"></span>
                        <button type="button" class="btn btn-primary" id="themkhuvuc" >  <%-- onserverclick="themkhuvuc" runat="server"--%>
                            Thêm mới
                        </button>
                    </td>
                </tr>
            </table>

            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="ID">Mã hàng</label>
                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                        <asp:TextBox ID="mahangid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Đơn vị to</label>
                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                        <asp:TextBox ID="dvtoid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="ID">Số lượng quy đổi</label>
                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                        <asp:TextBox ID="slquydoiid" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Đơn vị nhỏ</label>
                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                        <asp:TextBox ID="dvnhoid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
           
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="ID">Giá nhập</label>
                        <asp:TextBox ID="txtgianhap" CssClass="form-control" placeholder="0" Text="0" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Giá sỉ</label>
                        <asp:TextBox ID="txtgiasi" CssClass="form-control" placeholder="0" Text="0" runat="server"></asp:TextBox>
                    </div>
                </div>
                 <div class="col-md-3">
                    <div class="form-group">
                        <label for="ID">Giá bán</label>
                        <asp:TextBox ID="txtgiaban" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Giá đã cấu thành</label>
                        <asp:TextBox ID="txtgiadonvito" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>            
        </div>
    </div>

     

    <div>
        <table id="example" class="table table-striped table-bordered" style="width: 100%">
            <thead>
                <tr>
                    <tr role="row">
                        <th>NO</th>
                        <th>Ma Hang</th>                       
                        <th>Ten Hang</th>                       
                        <th>DVT T0</th>
                        <th>So luong quy doi</th>
                        <th>DVT nho</th>
                        <th>Giá nhập</th>
                        <th>Giá bán</th>
                        <th>Giá sỉ</th>
                        <th>Giá cấu thành</th>

                        <th>Action</th>
                    </tr>
                </tr>
            </thead>
            <tbody>
                <%int i = 0; %>
                <%foreach (System.Data.DataRow rows in dt_dvt.Rows)
                    {%>
                <%i++;%>
                <tr role="row">
                    <td><%=i %></td>
                    <td><%=rows["mahang"].ToString()%></td> 
                    <td><%=rows["tenhang"].ToString()%></td>
                    <td><%=rows["dvtto"].ToString()%></td>
                    <td><%=rows["soluongqudoi"].ToString()%></td>
                    <td><%=rows["dvtnho"].ToString()%></td>

                    <td><%=rows["gianhap"].ToString()%></td>
                    <td><%=rows["giaban"].ToString()%></td>
                    <td><%=rows["giabuon"].ToString()%></td>
                    <td><%=rows["giaban2"].ToString()%></td>

                    <td>
                        <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal2('<%= rows["id"].ToString() %>',
                                                '<%= rows["mahang"].ToString() %>',
                                                '<%= rows["dvtto"].ToString() %>',
                                                '<%= rows["soluongqudoi"].ToString() %>',
                                                '<%= rows["dvtnho"].ToString() %>',
                                                '<%=rows["gianhap"].ToString()%>',
                                                '<%=rows["giaban"].ToString()%>',
                                                '<%=rows["giabuon"].ToString()%>',
                                                '<%=rows["giaban2"].ToString()%>'
                                                )"><i class="fas fa-pencil-alt"></i>Sửa</a>
                    </td>

                </tr>
                <%} %>
            </tbody>

        </table>
    </div>


    <div class="modal" id="myModal2">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="row">
                        <div>
                            <h4 class="modal-title" id="headerTag" style="float: left">Sửa cấu thành đơn vị tính</h4>
                            <%--<h6 class="modal-title" id="headerTag" style="float: left; color:red"><b><i>Chi tiết tồn kho!</i></b></h6>--%>

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right; margin-left: 300px;">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                    </div>
                </div>

                <%-- Modal footer --%>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="ID">ID</label>
                                    <span style="color: green; font-size: 11px; font-style: italic;">(Read only)</span>
                                    <asp:TextBox ID="txtid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Mã hàng</label>
                                    <asp:TextBox ID="txtmahang" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="ID">Đơn vị to</label>
                                    <asp:TextBox ID="txtto" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Số lượng Quy đổi</label>
                                    <asp:TextBox ID="txtquydoi" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="ID">Đơn vị nhỏ</label>
                                    <asp:TextBox ID="txtnho" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="ID">Giá nhập</label>
                                <asp:TextBox ID="suagianhap" CssClass="form-control" placeholder="0" Text="0" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Giá sỉ</label>
                                <asp:TextBox ID="suagiasi" CssClass="form-control" placeholder="0" Text="0" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="ID">Giá bán</label>
                                <asp:TextBox ID="suagiaban" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Giá đã cấu thành</label>
                                <asp:TextBox ID="suagiadvto" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Đóng</button>
                    <button type="button" runat="server" id="btnOrder" onserverclick="updatekhuvuc" class="btn btn-primary">
                        <i class="fas fa-download"></i>
                        Ghi lại
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="../../dist/js/adminlte.min.js"></script>
    <script src="../../dist/js/demo.js"></script>

    <script src="../plugins/jquery-ui/jquery-ui.js"></script>


    <script>
        $(document).ready(function () {
            SearchText();

            //$("#example").DataTable({
            //                "responsive": true,
            //                "autoWidth": true,
            //                //"order": [[7, "desc"]],
            //                "pageLength": 50
            //                //"ordering": true,
            //                //"paging": true,
            //                //"lengthChange": false,
            //                //"searching": false,
            //                //"info": true,                    
            //            });

             $('#timkiemmahang').click(function() {
                 var tenhang = $("#MainContent_phieunhaphang").val();
                 //alert(tenhang);
                 var data = {tenhang :  tenhang};
                 $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "danhmuccauthanhdvt.aspx/timkiemhanghoa",
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                            //response(data.d);
                            //alert(data.d);
                            window.location.href = "/danhmuccauthanhdvt.aspx?tenhanghoa='" + data.d + "' ";
                            //window.location.href = "/danhmuccauthanhdvt.aspx";
                        },
                        error: function (result) {
                            //alert("No Match");
                        }
                    });

            });

            $('#themkhuvuc').click(function() {
                 var mahang = $("#MainContent_mahangid").val();
                 var donvito = $("#MainContent_dvtoid").val();
                 var soluongquydoi = $("#MainContent_slquydoiid").val();
                 var donvinho = $("#MainContent_dvnhoid").val();
                 var gianhap = $("#MainContent_txtgianhap").val();
                 var giasi = $("#MainContent_txtgiasi").val();
                 var giaban = $("#MainContent_txtgiaban").val();
                var giacauthanh = $("#MainContent_txtgiadonvito").val();

                 //alert(tenhang);
                 var data = {mahang :  mahang,donvito:donvito,soluongquydoi:soluongquydoi,donvinho:donvinho,gianhap:gianhap,giasi:giasi,giaban:giaban,giacauthanh:giacauthanh};
                 $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "danhmuccauthanhdvt.aspx/themmoicauthanh",
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                            if (data.d == "OK") {
                                alert('Them cau thanh dvt thanh cong!');
                                window.location.href = "/danhmuccauthanhdvt.aspx ";
                            }
                            else
                            {
                                alert('NG, kiểm tra lại thông tin!');
                                window.location.href = "/danhmuccauthanhdvt.aspx ";
                            }
                            
                            //window.location.href = "/danhmuccauthanhdvt.aspx";
                        },
                        error: function (result) {
                            //alert("No Match");
                        }
                    });

                });

        });

      



        function SearchText() {
            //debugger;
            $("#MainContent_phieunhaphang").autocomplete({
                source: function (request, response) {
                    var _mahang = $("#MainContent_phieunhaphang").val();
                    var data = { _mahang: _mahang };
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Phieubanhang.aspx/searchmahang",
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            //alert("No Match");
                        }
                    });
                }
            });
        }

        $("#MainContent_phieunhaphang").on('keyup', function (e) {
            if ((e.key === 'Enter' || e.keyCode === 13)) {
                var mahang = $("#MainContent_phieunhaphang").val();
                //alert(mahang);
                var data = { mahang: mahang };
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "danhmuccauthanhdvt.aspx/laymahang_chuan",
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function (data) {
                        //alert(data.d);                            
                        if (data.d != "NG") {
                            var chuoihang = data.d.split(',');
                            $("#MainContent_mahangid").val(chuoihang[0]);
                            $("#MainContent_dvnhoid").val(chuoihang[1]);
                            $('#MainContent_txtgiaban').val(chuoihang[2]);
                        }
                        else { }
                    },
                    error: function () {
                        //alert("No Match");
                    }
                });
            }
        });

        function openEditModal2(id, mahang, dvtto, soluongqudoi, dvtnho, gianhap, giaban, giasi, giacauthanh) {
            $("#MainContent_txtid").val(id);
            $("#MainContent_txtmahang").val(mahang);
            $("#MainContent_txtto").val(dvtto);
            $("#MainContent_txtquydoi").val(soluongqudoi);
            $("#MainContent_txtnho").val(dvtnho);

            $("#MainContent_suagianhap").val(gianhap);
            $("#MainContent_suagiasi").val(giasi);
            $("#MainContent_suagiaban").val(giaban);
            $("#MainContent_suagiadvto").val(giacauthanh);

            $('#myModal2').modal('show');

        }

        //slquydoiid
        $('#MainContent_slquydoiid').change(function () {
            var soluong = $(this).val();
            //alert(soluong);
            var dongia = $('#MainContent_txtgiaban').val();
            var dongiacauthanh = soluong * dongia;
            //alert(dongiacauthanh);
            $('#MainContent_txtgiadonvito').val(dongiacauthanh);
        });

    </script>




</asp:Content>
