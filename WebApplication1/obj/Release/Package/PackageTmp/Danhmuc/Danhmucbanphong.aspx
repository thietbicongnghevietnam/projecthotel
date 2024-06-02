<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Danhmucbanphong.aspx.cs" Inherits="WebApplication1.Danhmuc.Danhmucbanphong" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Danh mục bàn phòng</title>
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
 <%--   <script src="../Exportexcel/jquery.table2excel.min.js"></script>--%>
</head>
<body>
     <form id="form1" runat="server">
           <div>
            <div class="card">
            <div class="card-header">
                <h1>Danh mục bàn phòng</h1>
                <br />
                <%--class="card-title"--%>
                <div class="col-sm-12">
                    <div style="float:left;">
                        Từ ngày:
                                    <%--<input type="text" id="datepicker" runat="server">--%>
                                    <input type="date" id="Date1" name="date" runat="server">
                    Đến ngày:                                    
                                    <input type="date" id="ngaychiid" name="date" runat="server">
                                    

                    <%--<input type="checkbox" id="check_partno_search" style="width: 20px; height: 20px;" name="check_partno_search">--%>
                    Bàn / Phòng:                                    
                                    <input type="text" id="banphongid" runat="server">
                    </div>
                    
                    <div class="col-md-3" style="float: left">
                        <div class="form-group">                   
                        <asp:DropDownList ID="dr_filter_cate" runat="server" 
                            AppendDataBoundItems="true"
                            DataTextField="tenkhuvuc"
                            DataValueField="id"
                            CssClass="form-control input-sm"> 
                        </asp:DropDownList> <%-- AutoPostBack="true"--%>
                            </div>
                        </div>

                    <button class="btn btn-primary" type="button" runat="server" onserverclick="Addnew_Click" >
                        <i class="fa fa-fw fa-lg fa-search"></i>Thêm mới</button>

                    

                    <%--<button class="btn btn-primary" type="button" runat="server" style="margin-left:20px;"  >
                        Inventory Equipment
                    </button>--%>
                  
                          
                    <button class="btn btn-primary" type="button" runat="server" style="margin-left:20px;" onserverclick="Download_Click" ><i class="fa fa-download"></i>Export</button>

                    <%--<button class="btn btn-success" type="button" runat="server" style="margin-left:50px;" ><i class="fa fa-download"></i><a href="ReportBorrowReturn.aspx" target="_blank" style="color:blue">Report Item</a></button>--%>
                  <%--  <button class="btn btn-success" type="button" runat="server" style="margin-left:50px;" onserverclick="Download_Click2" ><i class="fa fa-download">Report Item</i></button>

                    <input type="text" id="itemid" runat="server">--%>
                   

                </div>


                <div class="col-md-3" style="float: left">
                    <div class="form-group">
                        
                    </div>
                </div>

               
               
            </div>
        </div>


             <div>
            <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                 <tr role="row">
                                        <th>NO</th>
                                        <th>tenphong</th>
                                        <th>khuvucid</th>
                                       <%-- <th>giophutroi</th>
                                        <th>giophutroitheophut</th> 
                                        <th>timephutroi</th> 
                                         <th>karaoke</th> 
                                        <th>tiengiohat</th>
                                        <th>nhanghi</th>
                                        <th>tiengionghi</th>
                                        <th>tiennghidem</th>
                                        <th>tiennghingay</th>
                                        <th>tiennghithang</th>--%>
                                                                               
                                        <th>Action</th>
                                    </tr>
            </tr>
        </thead>
        <tbody>
                                <%int i = 0; %>
                                    <%foreach (System.Data.DataRow rows in dt_banphong.Rows)
                                        {%>
                                     <%i++;%>
                                    <tr role="row">                                        
                                        <td><%=i %></td>
                                        <td><%=rows["tenphong"].ToString()%></td>
                                        <td><%=rows["khuvucid"].ToString()%></td>
                                       <%-- <td><%=rows["giophutroi"].ToString()%></td>
                                        <td><%=rows["giophutroitheophut"].ToString()%></td>
                                        <td><%=rows["timephutroi"].ToString()%></td>
                                         <td><%=rows["karaoke"].ToString()%></td> 
                                        <td><%=rows["tiengiohat"].ToString()%></td>
                                        <td><%=rows["nhanghi"].ToString()%></td>
                                        <td><%=rows["tiengionghi"].ToString()%></td>
                                        <td><%=rows["tiennghidem"].ToString()%></td>
                                        <td><%=rows["tiennghingay"].ToString()%></td>
                                        <td><%=rows["tiennghithang"].ToString()%></td>
                                       --%>
                                        <td>
                                            <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal2('<%= rows["tenphong"].ToString() %>')"><i class="fas fa-pencil-alt"></i>Sửa khu vực</a>
                                            &nbsp;&nbsp;&nbsp;<a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal3('<%= rows["tenphong"].ToString() %>',
                                                '<%= rows["tiengionghi"].ToString() %>',
                                                '<%= rows["timephutroi"].ToString() %>',
                                                '<%= rows["giophutroi"].ToString() %>',
                                                '<%= rows["giophutroitheophut"].ToString() %>',
                                                '<%= rows["tiennghidem"].ToString() %>',
                                                '<%= rows["tiennghingay"].ToString() %>',
                                                '<%= rows["tiennghithang"].ToString() %>',
                                                '<%= rows["tiengiohat"].ToString() %>',
                                                '<%= rows["nhanghi"].ToString() %>',
                                                '<%= rows["karaoke"].ToString() %>')"><i class="fas fa-pencil-alt"></i>Cài đặt bàn/phòng</a>
                                           &nbsp;&nbsp; <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal4('<%= rows["tenphong"].ToString() %>')"><i class="fas fa-pencil-alt"></i>Xóa</a>
                                        </td> 
                                        
                                    </tr>
                                    <%} %>
                     </tbody>                      

    </table>
        </div>



        </div>

         <div class="modal" id="myModal4">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">Bạn có chắc muốn xóa phòng?</h4>                                
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
                                        <label for="ID">Item</label>
                                        <span style="color: green; font-size: 11px; font-style: italic;">(Read only)</span>
                                        <asp:TextBox ID="txtphongid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1"></label>
                                       
                                    </div>
                                </div>
                            </div>                                                       
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>
                        <button type="button" runat="server" id="Button2" onserverclick="Xoabanphong" class="btn btn-primary">
                            <i class="fas fa-download"></i>
                            Xoa
                        </button>
                    </div>
                </div>
            </div>
        </div>


         <div class="modal" id="myModal2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">Sửa bàn phòng</h4>
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
                                        <label for="ID">Item</label>
                                        <span style="color: green; font-size: 11px; font-style: italic;">(Read only)</span>
                                        <asp:TextBox ID="txttenphong" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Khu vực</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <%--<asp:TextBox ID="txtkhuvuc" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>--%>
                                        <asp:DropDownList ID="dr_khuvuc" runat="server" AppendDataBoundItems="true" 
                                                    DataTextField="tenkhuvuc" 
                                                    DataValueField="id" 
                                                    CssClass="form-control input-sm">
                                     </asp:DropDownList>
                                    </div>
                                </div>
                            </div> 

                          

                             <%--<div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="QtyNG">Date borrow</label>                                       
                                        <input type="text" id="txtngaymuon" runat="server">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Date Return</label>                                                                               
                                        <input type="text" id="txtngaytra" runat="server">
                                    </div>
                                </div>
                            </div>--%>
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>
                        <button type="button" runat="server" id="btnOrder" onserverclick="updatebanphong" class="btn btn-primary">
                            <i class="fas fa-download"></i>
                            Save
                        </button>
                    </div>
                </div>
            </div>
        </div>

         <div class="modal" id="myModal3">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">Cài đặt cấu hình</h4>
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
                                        <label for="ID">Item</label>
                                        <span style="color: green; font-size: 11px; font-style: italic;">(Read only)</span>
                                        <asp:TextBox ID="maphong" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Chọn mô hình</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <br />
                                        <asp:RadioButton ID="nhahangid" runat="server" Text="NH-cafe" GroupName="Options" />
                                        <asp:RadioButton ID="karaokeid" runat="server" Text="Karaoke" GroupName="Options" />
                                        <asp:RadioButton ID="hotelid" runat="server" Text="Hotel" GroupName="Options" />

                                    </div>
                                </div>
                            </div> 
                          

                             <div class="row">
                                 <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Tiền nghỉ 1 giờ</label>                                                                               
                                         <asp:TextBox ID="tiengionghi" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="QtyNG">Time phụ trội</label>                                       
                                       <asp:TextBox ID="thoigianphutroi" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                
                            </div>

                             <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="QtyNG">Tiền giờ phụ trội</label>                                       
                                       <asp:TextBox ID="tiengiophutroi" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Giờ phụ trội theo phút</label>                                                                               
                                         <asp:TextBox ID="tiengiophutroitheophut" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                              <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="QtyNG">Tiền nghỉ đêm</label>                                       
                                       <asp:TextBox ID="tiennghidem" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Tiền nghỉ ngày</label>                                                                               
                                         <asp:TextBox ID="tiennghingay" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="QtyNG">Tiền nghỉ tháng</label>                                       
                                       <asp:TextBox ID="tiennghithang" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Tiền giờ karaoke / giờ</label>                                                                               
                                         <asp:TextBox ID="tienkaraoke" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>


                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>
                        <button type="button" runat="server" id="Button1" onserverclick="settingphongban" class="btn btn-primary">
                            <i class="fas fa-download"></i>
                            Save
                        </button>
                    </div>
                </div>
            </div>
        </div>

    </form>
    
        <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="../../dist/js/adminlte.min.js"></script>
    <script src="../../dist/js/demo.js"></script>

     <script>
   $(document).ready(function () {            
            //$('#txtdevice').prop("readonly", true);
        });

            $(function () {
                        $("#example").DataTable({
                            "responsive": true,
                            "autoWidth": true,
                            //"order": [[7, "desc"]],
                            "pageLength": 50
                            //"ordering": true,
                            //"paging": true,
                            //"lengthChange": false,
                            //"searching": false,
                            //"info": true,                    
                        });

                    });

        function openEditModal2(tenphong) {           
            $("#txttenphong").val(tenphong);
            var fromdate  = $("#Date1").val();
            var todate  = $("#ngaychiid").val();                                  
            $('#myModal2').modal('show');
         }

         function openEditModal4(tenphong) {           
            $("#txtphongid").val(tenphong);                                              
            $('#myModal4').modal('show');
         }

         function openEditModal3(maphongid, tiengionghiid, thoigianphutroiid, tiengiophutroiid, tiengiophutroitheophutid, tiennghidemid, tiennghingayid, tiennghithangid, tienkaraokeid,nhanghi,karaoke) {   
             //alert(tienkaraokeid);
            $("#maphong").val(maphongid);
             $("#tiengionghi").val(tiengionghiid);
             $("#thoigianphutroi").val(thoigianphutroiid);
             $("#tiengiophutroi").val(tiengiophutroiid);
             $("#tiengiophutroitheophut").val(tiengiophutroitheophutid);
             $("#tiennghidem").val(tiennghidemid);
             $("#tiennghingay").val(tiennghingayid);
             $("#tiennghithang").val(tiennghithangid);
             $("#tienkaraoke").val(tienkaraokeid);
             if (nhanghi == '1')
             {
                 document.getElementById("hotelid").checked = true;
             }
             else if (karaoke == '1')
             {
                 document.getElementById("karaokeid").checked = true;
             }
             else
             {
                 document.getElementById("nhahangid").checked = true;
             }
                                            
            $('#myModal3').modal('show');
        }

        
    </script>

     <script src="../plugins/jquery-ui/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            var onlyDate, today = new Date();
            var dateNewFormat = '';

            onlyDate = today.getDate();
            if (onlyDate.toString().length == 2) {

                dateNewFormat = onlyDate;
            }
            else {
                dateNewFormat = '0' + onlyDate;
            }

            dateNewFormat = dateNewFormat + '-';

            if (today.getMonth().length == 2) {

                dateNewFormat += (today.getMonth() + 1);
            }
            else {
                //dateNewFormat += '0' + (today.getMonth() + 1);
                dateNewFormat += (today.getMonth() + 1);
            }

            dateNewFormat = dateNewFormat + '-' + today.getFullYear();
            //dateNewFormat = today.getFullYear() + '-';

            //$('#datepicker').val(dateNewFormat);
           

            //$("#datepicker").datepicker({ dateFormat: 'dd-mm-yy' });
 $("#txtngaymuon").datepicker({ dateFormat: 'dd-mm-yy' });
 $("#txtngaytra").datepicker({ dateFormat: 'dd-mm-yy' });
        });


    </script>

</body>
</html>
