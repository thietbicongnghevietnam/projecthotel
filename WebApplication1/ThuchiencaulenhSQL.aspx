<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThuchiencaulenhSQL.aspx.cs" Inherits="WebApplication1.ThuchiencaulenhSQL" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hệ thống báo cáo động</title>
    <style type="text/css">
    .popup {
        background-color: #fff;
        border: 1px solid #ccc;
        padding: 10px;
        width: 300px;
    }

    .modalBackground {
        background-color: #000;
        opacity: 0.7;
        filter: alpha(opacity=70);
    }
</style>
     <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../plugins/toastr/toastr.js"></script>

</head>
<body>
    <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h3 class="m-0">Hệ thống quản trị</h3>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
   <%-- <p style="color:blue;">
                    <asp:Label ID="lblConfirm" Text="" runat="server"></asp:Label>
                </p>--%>

    <form id="form1" runat="server">
        <div>
             <%--<asp:TextBox id="txtsql" TextMode="multiline" Columns="50" Rows="5" runat="server" />

             <button class="btn btn-success" type="button" runat="server" style="margin-left:50px;" onserverclick="thucthicaulenh" ><i class="fa fa-download">EXEC</i></button>--%>

            <textarea id="txtsql" name="txtcomment" rows="4" cols="50">            
            </textarea>

            <button class="btn btn-success" type="button" runat="server" style="margin-left:50px;" id="xulyid" ><i class="fa fa-download">EXEC</i></button>

        </div>
    </form>

<div id="passwordModal" class="modal">
  <div class="modal-content">
    <label for="password">****:</label>
    <input type="password" id="password" name="password">
   <%-- <button id="submitPassword">Xác nhận</button>--%>
  </div>
</div>


    <script>
             $('#xulyid').click(function () {
                //alert('vao day roi');
                var  chuoisql = $('#txtsql').val();
                //alert(chuoisql);    
                    var modal = document.getElementById("passwordModal");
                        modal.style.display = "block";

                    if (confirm("Bạn có chắc muốn thực thi câu lệnh?") == true) {
                        var modal = document.getElementById("passwordModal");
                        modal.style.display = "block";
                
                       // document.getElementById("submitPassword").onclick = function() {
                            var passwordInput = document.getElementById("password").value;
                            if (passwordInput.trim() !== "") {                                
                                if (passwordInput === 'exec1986') {
                                    var data = { chuoisql: chuoisql };
                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: "ThuchiencaulenhSQL.aspx/thucthicaulenh",
                                        data: JSON.stringify(data),
                                        dataType: "json",
                                        success: function (data) {
                                            if (data.d === 'OK') {
                                                alert('Thực thi câu lệnh thành công!');
                                            } else {
                                                alert('Có lỗi xảy ra khi thực thi câu lệnh!');
                                            }
                                        },
                                        error: function () {
                                            alert("Đã xảy ra lỗi!");
                                        }
                                    });
                                } else {
                                    alert("Mật khẩu không đúng!");
                                }
                                modal.style.display = "none"; // Ẩn modal sau khi xử lý
                            } else {
                                alert("Vui lòng nhập mật khẩu!");
                            }
                        //};
                    } else {
                        console.log('Bạn không muốn tiếp tục');
                    }
              //  if (confirm("bạn nhập mật khảu để thực thi câu lệnh ?") == true) {                       
              //          var passwordInput = prompt("Vui lòng nhập mật khẩu để kiểm tra:", ""); // Đây là hộp thoại nhập mật khẩu
              //          if (passwordInput !== null && passwordInput.trim() !== "") {                         
              //              if(passwordInput == 'exec1986')
              //              {
              //                  var data = {chuoisql : chuoisql}
              //                  $.ajax({
              //                              type: "POST",
              //                              contentType: "application/json; charset=utf-8",
              //                              url: "ThuchiencaulenhSQL.aspx/thucthicaulenh",
              //                              data: JSON.stringify(data),
             //                               dataType: "json",
              //                             success: function (data) {
              //                                 if(data.d == 'OK')
              //                                  {
              //                                      alert('Success!');
              //                                  }
              //                              },
              //                              error: function () {
               //                                 //alert("No Match");
               //                             }
               //                         });
               //             }
               //             else
               //             {
                //                alert("Bạn không có quyển thực thi!");
                 ///           }                            
                //        } else {
                //            alert("Vui lòng nhập dữ liệu trước khi thực thi câu lệnh!");
                //        }
                //    } else {
                //        console.log('Bạn không muốn tiếp tục');
                //    }




             });





    </script>

</body>
</html>
