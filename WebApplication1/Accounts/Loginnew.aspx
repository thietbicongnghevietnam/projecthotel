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

</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="#"><b>Admin</b>Tiger</a>
  </div>
     <form id="form1" runat="server">
         <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Sign in to start your session</p>

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
                                            <%-- <a class="small" href="http://10.92.184.24:8010/" target="_blank">QR-Code generate</a> --%>
                                             <a class="small" href="#" target="_blank">QR-Code generate</a> 
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
     </script>


</body>
</html>
