<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Danhmuchanghoa.aspx.cs" Inherits="WebApplication1.Danhmuc.Danhmuchanghoa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Danh mục hàng hóa</title>
     <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

    <link rel="stylesheet" href="../plugins/toastr/toastr.css" />
    <link rel="stylesheet" href="../dist/css/adminlte.min.css" />
        <link rel="stylesheet" href="../plugins/jquery-ui/jquery-ui.css" />

    <link rel="stylesheet" href="../content/bootstrap.css" />


 <%--   <link rel="stylesheet" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap4.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.bootstrap4.css" />--%>
  

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
                <h1>Danh mục hàng hóa</h1>
                <br />
                <p>
                    <asp:Label ID="lblConfirm" Text="" runat="server"></asp:Label>
                </p>
                <%--class="card-title"--%>
                <div class="col-sm-12">
                    <div style="float:left;">
                        Từ ngày:
                                    <%--<input type="text" id="datepicker" runat="server">--%>
                                    <input type="date" id="Date1" name="date" runat="server">
                    Đến ngày:                                    
                                    <input type="date" id="ngaychiid" name="date" runat="server">
                                    

                    <%--<input type="checkbox" id="check_partno_search" style="width: 20px; height: 20px;" name="check_partno_search">--%>
                   <%-- Bàn / Phòng:                                    
                                    <input type="text" id="banphongid" runat="server">--%>
                    </div>
                    
                  
                    <span style="padding-left:20px;"></span>
                   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                     Thêm mới
                    </button>
                                        
                    <!-- import file excel -->
                <!-- ADD A FILE UPLOAD CONTROL AND A BUTTON TO EXECUTE. -->
                <div style="font: 14px Verdana; float: right">
                    <p style="margin-top: 0px; margin-left: 20px;">
                       Chọn file để upload:
                        <asp:FileUpload ID="FileUpload" Width="450px" runat="server" />
                    </p>
                    <p style="margin-top: 0px; margin-left: 20px;">
                        <input type="button" onserverclick="ImportFromExcel" value="Import data to Excel" runat="server" class="btn btn-primary" />

                        <button type="button" class="btn btn-primary float-right" style="margin-right: 5px;" onserverclick="btnDownloadClick" runat="server">
                            <i class="fas fa-download"></i>Tải file mẫu upload
                        </button>
                    </p>
                    <p>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </p>

                </div>
                
                   <%-- <button class="btn btn-primary" type="button" runat="server" style="margin-left:20px;" onserverclick="Download_Click" ><i class="fa fa-download"></i>Export</button>--%>
                   <button class="btn btn-primary" type="button" runat="server" style="margin-left:20px;" onserverclick="btnExport_Click" ><i class="fa fa-download"></i>Export</button>
                  
                   

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
         
                 <tr role="row">
                                        <th>NO</th>
                                        <th>mahang</th>
                                        <th>tenhang</th>
                                        <th>dvt</th>
                                      <%--  <th>soluongton</th> --%>
                                        <th>gianhap</th> 
                                         <th>giaban</th> 
                                        <th>tennhomhang</th>

                                      
                                                                               
                                        <th>Action</th>
                     </tr>
  
        </thead>
        <tbody>
                                <%int i = 0; %>
                                    <%foreach (System.Data.DataRow rows in dt_hanghoa.Rows)
                                        {%>
                                     <%i++;%>
                                    <tr role="row">                                        
                                        <td><%=i %></td>
                                        <td><%=rows["mahang"].ToString()%></td>
                                        <td><%=rows["tenhang"].ToString()%></td>
                                        <td><%=rows["dvt"].ToString()%></td>
                                       <%-- <td><%=rows["soluongton"].ToString()%></td>--%>
                                        <td><%=rows["gianhap"].ToString()%></td>
                                         <td><%=rows["giaban"].ToString()%></td> 
                                        <td><%=rows["tennhomhang"].ToString()%></td>
                                        
                                       
                                        <td>
                                            <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal2('<%= rows["mahang"].ToString() %>','<%= rows["tenhang"].ToString() %>','<%= rows["dvt"].ToString() %>','<%= rows["gianhap"].ToString() %>','<%= rows["giaban"].ToString() %>','<%=rows["tennhomhang"].ToString()%>')"><i class="fas fa-pencil-alt"></i>Sửa</a>
                                        </td> 
                                        
                                    </tr>
                                    <%} %>
                             </tbody>              

    </table>
        </div>



        </div>


         <div class="modal" id="myModal2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">Sửa hàng hóa</h4>
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
                                        <label for="ID">Mã hàng</label>
                                        <span style="color: green; font-size: 11px; font-style: italic;">(Read only)</span>
                                        <asp:TextBox ID="txtmahang" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Tên hàng</label>                                        
                                        <asp:TextBox ID="txttenhang" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Đơn vị tính</label>                                        
                                        <asp:TextBox ID="txtdovitinh" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Giá nhập</label>                                       
                                        <asp:TextBox ID="txtgianhap" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div> 
                        <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Giá bán</label>                                       
                                        <asp:TextBox ID="txtgiaban" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Nhóm hàng</label>
                                       <asp:DropDownList ID="dr_nhomhang2" runat="server" AppendDataBoundItems="true" 
                                                    DataTextField="manhomhang" 
                                                    DataValueField="id" 
                                                    CssClass="form-control input-sm">
                                     </asp:DropDownList>                                      
                                    </div>
                                </div>
                            </div> 
                          
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Đóng</button>
                        <button type="button" runat="server" id="btnOrder" onserverclick="updatehanghoa" class="btn btn-primary">
                            <i class="fas fa-download"></i>
                            Ghi lại
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm mới hàng hóa</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
                         <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Ma hàng</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <asp:TextBox ID="mahangid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Tên hàng</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <asp:TextBox ID="tenhangid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div> 
                        <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Đơn vị tính</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <asp:TextBox ID="dvtid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Giá nhập</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <asp:TextBox ID="gianhapid" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div> 
                        <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Giá bán</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <asp:TextBox ID="giabanid" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Nhóm hàng</label>
                                       <asp:DropDownList ID="dr_nhomhang" runat="server" AppendDataBoundItems="true" 
                                                    DataTextField="manhomhang" 
                                                    DataValueField="id" 
                                                    CssClass="form-control input-sm">
                                     </asp:DropDownList>                                      
                                    </div>
                                </div>
                            </div> 


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
        <button type="button" class="btn btn-primary" runat="server" onserverclick="themhanghoa">Ghi lại</button>
      </div>
    </div>
  </div>
</div>

    </form>

       <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../plugins/datatables/jquery.dataTables.js"></script>
    <script src="../../plugins\datatables-buttons\js\dataTables.buttons.js"></script>
    <%--<script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.0.6/js/dataTables.bootstrap4.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.bootstrap4.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>--%>
    

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
                    "pageLength": 50,
                            "buttons": ['copy', 'csv', 'excel'],
                            //"ordering": true,
                            //"paging": true,
                            //"lengthChange": false,
                            //"searching": false,
                            //"info": true,                    
                });
                

         });

         //$('#myModal').modal()

    function openEditModal2(mahang,tenhang,dvt,gianhap,giaban,tennhomhang) {           
        $("#txtmahang").val(mahang);
        $("#txttenhang").val(tenhang);
        $("#txtdovitinh").val(dvt);
        $("#txtgianhap").val(gianhap);
        $("#txtgiaban").val(giaban);
        //$("#dr_nhomhang2").val(tennhomhang);        
        $('#myModal2').modal('show');

        }

        
    </script>

     <script src="../plugins/jquery-ui/jquery-ui.js"></script>
    <script type="text/javascript">
//        $(function () {
//            var onlyDate, today = new Date();
//            var dateNewFormat = '';

//            onlyDate = today.getDate();
//            if (onlyDate.toString().length == 2) {

//                dateNewFormat = onlyDate;
//            }
//            else {
//                dateNewFormat = '0' + onlyDate;
//            }

//            dateNewFormat = dateNewFormat + '-';

//            if (today.getMonth().length == 2) {

//                dateNewFormat += (today.getMonth() + 1);
//            }
//            else {
//                //dateNewFormat += '0' + (today.getMonth() + 1);
//                dateNewFormat += (today.getMonth() + 1);
//            }

//            dateNewFormat = dateNewFormat + '-' + today.getFullYear();
//            //dateNewFormat = today.getFullYear() + '-';

//            //$('#datepicker').val(dateNewFormat);
           

//            //$("#datepicker").datepicker({ dateFormat: 'dd-mm-yy' });
// //$("#txtngaymuon").datepicker({ dateFormat: 'dd-mm-yy' });
//// $("#txtngaytra").datepicker({ dateFormat: 'dd-mm-yy' });
//        });


    </script>

</body>
</html>
