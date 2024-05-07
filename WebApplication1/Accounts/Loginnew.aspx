<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginnew.aspx.cs" Inherits="WebApplication1.Accounts.Loginnew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
   
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
    
    <link rel="stylesheet" href="../plugins/toastr/toastr.css" />

    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../plugins/toastr/toastr.js"></script>

    <style>
        .popup {
                display: inline-block;
            }
            .popup .popuptext {
                visibility: hidden;
                width: 160px;
                background-color: #b1b1b1;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 20px;
                position:relative;
                top:50px;
                right:150px;
            }
            .popup .show {
                visibility: visible;
                -webkit-animation: fadeIn 1s;
                animation: fadeIn 1s;
            }
    </style>

</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">      
    <a href="#"><b>Restaurant - Hotel - Cafe</b></a>
  </div>
     <form id="form1" runat="server">
         <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p style=" height:50px; text-align:center;"><%--Sign in to start your session--%>  <%--class="login-box-msg"--%>
           <img src="../../dist/img/logo_eagle.JPG" alt="user-avatar" class="img-circle img-fluid" style="width:100px;height:100px;">
          <a href="#"><b>Sky </b> <i>Eagle</i> <b>Soft </b></a>
      </p>       
                                <div class="card-body">                                  
                                         <div class="form-group">
                                             <label class="small mb-1" for="inputEmailAddress">Username</label>
                                             <input class="form-control" name="username" id="inputUser" type="text" placeholder="Enter username" />
                                         </div>
                                         <div class="form-group">
                                             <label class="small mb-1" for="inputPassword">Password</label>
                                             <input class="form-control" name="password" id="inputPassword" type="password" placeholder="Enter password" />
                                         </div>
                                         <div class="form-group">
                                             <div class="custom-control custom-checkbox">
                                                 <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" />
                                                 <label class="custom-control-label" for="rememberPasswordCheck">Remember password</label>
                                             </div>
                                         </div>
                                         <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                             <a class="small" href="#">Forgot Password? </a>                                            
                                            <%-- <a class="small" href="#" target="_blank" id="openModalBtn">Contact Admin</a> --%>
                                              <div style="text-align:center; width:100px; height:20px;">
                                              <a href="#" onclick="pop()">Contact</a>
                                              <div class="popup">
                                                <span class="popuptext" id="myPopup">
                                                  thank contac admin <input type="text" id="addminid" />
                                                </span>
                                              </div>
                                            </div>

                                            <a href="#" class="small" onserverclick="btnDownloadIEClick" runat="server">Download Google Chrome</a>
                                             <%--<asp:Button id="btn_login" Text="Login" CssClass="btn btn-info" OnClick="BtnLoginClick" runat="server" />--%>
                                            <%-- <input id="btn_login" type="button" value="Login" Class="btn btn-info" OnServerclick="BtnLoginClick" runat="server" /> class="btn btn-primary"--%>
                                             <input id="dangnhapid" class="btn btn-primary" value="Login" type="button" runat="server" onserverclick="BtnLoginClick" />
                                         </div>                                    
                                    </div>


<%--      <div class="social-auth-links text-center mb-3">
        <p>- OR -</p>
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
        </a>
      </div>
      <!-- /.social-auth-links -->

      <p class="mb-1">
       <%-- <a href="forgot-password.html">I forgot my password</a>--%>
           <%--<a href="#">I forgot my password</a>--%>
      <%--</p>--%>
    <%--  <p class="mb-0">--%>
        <%--<a href="register.html" class="text-center">Register a new membership</a>--%>
          <%-- <a href="#" class="text-center">Register a new membership</a>--%>
      <%--</p>--%>
    </div>
    <!-- /.login-card-body -->
  </div>


     </form>




  
</div>
<!-- /.login-box -->

    <script>
       function pop() {
    var popup = document.getElementById('myPopup');
    popup.classList.toggle('show');
}
    </script>

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
  
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>

     <script type="text/javascript">
         $(document).ready(function () {             
             $("#inputUser").select();
         });
         $("#inputUser").on('keyup', function (e) {           
            if (e.key === 'Enter' || e.keyCode === 13) {
                $("#inputPassword").select();
            }
        });
         $("#inputPassword").on('keyup', function (e) {             
             if (e.key === 'Enter' || e.keyCode === 13) {                
                 //$("#ContentPlaceHolder1_btn_login").click();
                //__doPostBack('btn_login','');
                $("#dangnhapid").click();
                //__doPostBack('ctl07', '');
             }
         });

         $("#addminid").on('keyup', function (e) {
             if ((e.key === 'Enter' || e.keyCode === 13)) {
                 var passadmin = $("#addminid").val();
                 //alert(passadmin);
                 var data = {passadmin:passadmin}
                 $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Loginnew.aspx/adminsupport",
                            //data: JSON.stringify(data),
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                //alert('Hàng hóa đã được thêm thành công!');
                                if (data.d != "NG") {
                                   
                                    //co the xu ly cac truong hop chua don phong, dat phong
                                } else {
                                    //nothing
                                    //toan bo ban phong khong co khach
                                }
                               
                            },
                            error: function () {
                                //alert("No Match");                                
                            }
                        });
             }

             });
         

     </script>


</body>
</html>
