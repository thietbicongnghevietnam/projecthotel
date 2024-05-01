<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baocaonhaphang.aspx.cs" Inherits="WebApplication1.Report.Baocaonhaphang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bao cao nhap hang</title>
   <%--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">--%>
    
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
                <h1>Báo cáo nhập hàng</h1>
                <br />
                <%--class="card-title"--%>
                <div class="col-sm-12">
                    Từ ngày:
                                    <%--<input type="text" id="datepicker" runat="server">--%>
                                    <input type="date" id="Date1" name="date" runat="server">
                    Đến ngày:                                    
                                    <input type="date" id="ngaychiid" name="date" runat="server">
                                    

                    <input type="checkbox" id="check_partno_search" style="width: 20px; height: 20px;" name="check_partno_search">
                    Item:                                    
                                    <input type="text" id="partno_search" runat="server">

                    <button class="btn btn-primary" type="button" runat="server" onserverclick="Search_Date_Click" >
                        <i class="fa fa-fw fa-lg fa-search"></i>Lọc</button>

                    
                    <button class="btn btn-primary" type="button" runat="server">
                        <i class="fa fa-download"></i><a href="../TemplateReport/nhaphangtheongayhd.aspx" target="_blank" style="color:white">Print</a></button>

                    <%--<button class="btn btn-primary" type="button" runat="server" style="margin-left:20px;"  >
                        Inventory Equipment
                    </button>--%>
                  
                          
                    <button class="btn btn-primary" type="button" runat="server" style="margin-left:20px;" onserverclick="Download_Click" ><i class="fa fa-download"></i>Export</button>

                    <%--<button class="btn btn-success" type="button" runat="server" style="margin-left:50px;" ><i class="fa fa-download"></i><a href="ReportBorrowReturn.aspx" target="_blank" style="color:blue">Report Item</a></button>--%>
                  <%--  <button class="btn btn-success" type="button" runat="server" style="margin-left:50px;" onserverclick="Download_Click2" ><i class="fa fa-download">Report Item</i></button>

                    <input type="text" id="itemid" runat="server">--%>
                   

                </div>


                <%--<div class="col-md-3" style="float: left">
                    <div class="form-group">
                        <label for="Group">Choose Type</label>
                        <asp:DropDownList ID="dr_filter_cate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="filter_cate_Change"
                            AppendDataBoundItems="true"
                            DataTextField="DESCRIPTION"
                            DataValueField="DESCRIPTION"
                            CssClass="custom-select custom-select-sm form-control form-control-sm"> 
                        </asp:DropDownList>
                    </div>
                </div>--%>

               
               
            </div>
        </div>


             <div>
            <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                 <tr role="row">
                                        <th>NO</th>
                                        <th>sohd</th>
                                        <th>items</th>
                                        <th>tongtien</th>
                                        <th>chietkhau</th> 
                                        <th>tongtienthanhtoan</th> 
                                         <th>psco</th> 
                                        <th>psno</th>
                                        <th>created</th>
                                                                               
                                        <th>Action</th>
                                    </tr>
            </tr>
        </thead>
        <tbody>
                                <%int i = 0; %>
                                    <%foreach (System.Data.DataRow rows in dt_BCNH.Rows)
                                        {%>
                                     <%i++;%>
                                    <tr role="row">                                        
                                        <td><%=i %></td>
                                        <td><%=rows["sohd"].ToString()%></td>
                                        <td><%=rows["items"].ToString()%></td>
                                        <td><%=rows["tongtien"].ToString()%></td>
                                        <td><%=rows["chietkhau"].ToString()%></td>
                                        <td><%=rows["tongtienthanhtoan"].ToString()%></td>
                                         <td><%=rows["psco"].ToString()%></td> 
                                        <td><%=rows["psno"].ToString()%></td>
                                        <td><%=rows["created"].ToString()%></td>
                                       
                                        <td>
                                           <%-- <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal2('<%= rows["sohd"].ToString() %>')"><i class="fas fa-pencil-alt"></i>View</a>--%>

                                            <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal6('<%= rows["id"].ToString() %>')" ><i class="fas fa-pencil-alt"></i>Chi tiet HD</a>
                                        </td> 
                                        
                                    </tr>
                                    <%} %>
                                     
                                </tbody>
        <%--<tfoot>
            <tr>
                <th>NO</th>
                                        <th>sohd</th>
                                        <th>items</th>
                                        <th>tongtien</th>
                                        <th>chietkhau</th> 
                                        <th>tongtienthanhtoan</th> 
                                         <th>psco</th> 
                                        <th>psno</th>
                                        <th>created</th>
                                                                               
                                        <th>Action</th>
            </tr>
        </tfoot>--%>

    </table>
        </div>



        </div>

        <div class="modal" id="myModal6">
            <div class="modal-dialog modal-lg" >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">THONG TIN HOA DON NHAP HANG</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right; margin-left: 300px;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>


                    <div class="modal-body">
                       
                       <div class="container-fluid" id="printableArea" style="width:400px;height:auto; float:left">
                           <%-- Hinh thuc: <b id="hinhthucnghi2"></b>
                            &nbsp;&nbsp;&nbsp; tongtienhat: <b id="tongtienhat2"></b><br />
                           Ten phong: <b id="tenphong2"></b>--%>
                           &nbsp;&nbsp;&nbsp; Tong tiền hàng: <b id="tongtien2"></b>                                                      


                                <div style="width: 100%; height: 300px; float: left;">  
                                    <table class="display table table-bordered dataTable no-footer">
                                        <thead>
                                            <tr>
                                                <th>Hanghoa</th>
                                                <th>tienhang</th>
                                                <th>statusKaraoke</th>
                                                <th>sohoadon</th>                                                 
                                            </tr>
                                            <tbody id="tbnhaphang_inhoadon">
                                            </tbody>


                                    </table>
                                </div>
                            
                           <br /> 
                           Tổng tiền: <b id="thantoan2"></b> &nbsp;&nbsp;&nbsp;  C/K: <b id="chietkau2"></b> <br />
                           Thanh toán NCC: <b id="khthanhtoan2"></b> &nbsp;&nbsp;&nbsp; Còn lại: <b id="psno2"></b>     
                           <div>Bằng chữ: <span id="bangchuid" style="font-weight:200; color:red;"></span></div>
                        </div>
                        
                                                                           
                    </div>

                    <div class="modal-footer">
                       <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>                                                                                            
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
                                <h4 class="modal-title" id="headerTag" style="float: left">Do you want order item?</h4>
                                <h6 class="modal-title" id="headerTag" style="float: left; color:red"><b><i>You need contact IT PIC to confirm!</i></b></h6>

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
                                        <asp:TextBox ID="txtsohoadon" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">User Order</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div> 

                             <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">                                          
                                        <label id="lbl_machine" for="dr_machine">Reason</label>
                                        <asp:DropDownList ID="dr_lydo" runat="server"
                                            AppendDataBoundItems="true"
                                            DataTextField="Title"
                                            DataValueField="Title"
                                            CssClass="custom-select custom-select-sm form-control form-control-sm">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group" >
                                       <label for="ID">Department</label>
                                        <asp:DropDownList ID="dr_phongban" runat="server"
                                            AppendDataBoundItems="true"
                                            DataTextField="Maphongban"
                                            DataValueField="Maphongban"
                                            CssClass="custom-select custom-select-sm form-control form-control-sm">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                             <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="QtyNG">Date borrow</label>
                                        <%--<asp:TextBox ID="txtngaymuon" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>--%>
                                        <input type="text" id="txtngaymuon" runat="server">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Date Return</label>                                        
                                        <%--<asp:TextBox ID="txtngaytra" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>--%>
                                        <input type="text" id="txtngaytra" runat="server">
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>
                        <button type="button" runat="server" id="btnOrder" onserverclick="BtnOrderItem" class="btn btn-primary">
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

    //function openEditModal2(sohoadon) {           
    //        $("#txtsohoadon").val(sohoadon);
    //        $('#myModal2').modal('show');
    //    }
    function openEditModal6(idhoadon)
        {
             var _fromdate  = $("#Date1").val();
             var _todate  = $("#ngaychiid").val();
             var data = {
                                idhoadon: idhoadon,
                                _fromdate: _fromdate,
                                _todate: _todate
                            };

               $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Baocaonhaphang.aspx/thongtinhoadon",
                        //data: JSON.stringify(data),
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                        debugger;
                            const objdata = $.parseJSON(data.d);
                            $('#tbnhaphang_inhoadon tr').remove();
                            debugger;
                            if (objdata['Table'] != "")
                            {
                                for (var i = 0; i < objdata['Table'].length - 1; i++)
                                {
                                var hanghoa = objdata['Table'][i][0];
                                var tienhang = objdata['Table'][i][1];
                                var loaihoadon = objdata['Table'][i][4];
                                var sohoadon = objdata['Table'][i][6];
                                var newrow = '<tr class="thongtinhoadon">' +
                                                        '<td id="_hanghoad">' + hanghoa + '</td>' +
                                                        '<td id="_tienhang">' + tienhang + '</td>' +
                                                        '<td id="_loaihoadon">' + loaihoadon + '</td>' +
                                                        '<td id="_sohoadon">' + sohoadon + '</td>' +                                                    
                                                        '</tr>';
                                                    $('#tbnhaphang_inhoadon').append(newrow); 
                                }
                            }
                            else
                            {
                                $('#tbnhaphang_inhoadon').append(newrow); 
                            }
                                                            
                            $('#myModal6').modal('show');                                                       
                        },
                        error: function () {
                            //alert("No Match");
                        }
                    });

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
