<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignalR_hub.aspx.cs" Inherits="WebApplication1.SignalR_hub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Real-time Data</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="Scripts/jquery.signalR-2.4.3.js"></script>
    <script src="/signalr/hubs"></script>
</head>
<body>
    <%--<form id="form1" runat="server">
        <div>
        </div>
    </form>--%>
    <div>test chuong trinh signalr hup</div>
    <div id="dataDisplay"></div>
    <script>
        $(function () {
            // Kết nối đến hub SignalR
            var connection = $.hubConnection();
            var hubProxy = connection.createHubProxy('dataHub');

            // Lắng nghe sự kiện cập nhật dữ liệu từ server
            hubProxy.on('updateData', function (data) {
                $('#dataDisplay').text(data);
            });

            // Khởi tạo kết nối
            connection.start().done(function () {
                console.log('Connected to SignalR hub');
            });

            // Gửi yêu cầu cập nhật dữ liệu
            setInterval(function () {
                hubProxy.invoke('sendData', 'New data from client');
            }, 1000); // Cập nhật mỗi giây
        });
    </script>
</body>
</html>
