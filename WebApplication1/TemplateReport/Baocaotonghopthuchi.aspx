<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baocaotonghopthuchi.aspx.cs" Inherits="WebApplication1.TemplateReport.Baocaotonghopthuchi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Báo cáo bán hàng theo hóa đơn</title>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            text-indent: 0;
        }

        h1 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 12pt;
        }

        .s1 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 8.5pt;
        }

        .s2 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: normal;
            text-decoration: none;
            font-size: 9pt;
        }

        .s3 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: normal;
            text-decoration: none;
            font-size: 8pt;
        }

        .s4 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: normal;
            text-decoration: none;
            font-size: 9pt;
        }

        .s5 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 7.5pt;
        }

        .s6 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: italic;
            font-weight: bold;
            text-decoration: none;
            font-size: 8pt;
        }

        .s7 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: italic;
            font-weight: bold;
            text-decoration: none;
            font-size: 10.5pt;
        }

        h2 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 8.5pt;
        }

        p {
            color: black;
            font-family: Arial, sans-serif;
            font-style: italic;
            font-weight: bold;
            text-decoration: none;
            font-size: 7pt;
            margin: 0pt;
        }

        table, tbody {
            vertical-align: top;
            overflow: visible;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <p style="padding-left: 6pt;text-indent: 0pt;line-height: 1pt;text-align: left;" />
    <h1 style="padding-top: 7pt;padding-left: 10pt;text-indent: 0pt;text-align: left;">Báo cáo tổng hợp thu chi : <span class="s1">Từ ngày :01/05/2024 Đến ngày :01/05/2024</span></h1>
    <%--<p class="s2" style="padding-top: 2pt;padding-left: 10pt;text-indent: 0pt;text-align: left;">Loại phiếu :&lt;Phiếu bán hàng&gt;</p>--%>
    <p style="text-indent: 0pt;text-align: left;"><br /></p>
    <table style="border-collapse:collapse;margin-left:5.325pt" cellspacing="0">
    <tr style="height:26pt">
        <td style="width:22pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt">
        <p class="s3" style="padding-top: 3pt;padding-left: 3pt;text-indent: 0pt;text-align: center;">STT</p></td>
        <td style="width:27pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 3pt;padding-left: 3pt;text-indent: 0pt;text-align: center;">Bàn</p></td>
        <td style="width:42pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 3pt;padding-left: 2pt;padding-right: 4pt;text-indent: 0pt;text-align: center;">Vào</p></td>
        <td style="width:41pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 2pt;text-indent: 0pt;text-align: center;">Ra</p></td>
        <td style="width:24pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 5pt;padding-left: 1pt;text-indent: 0pt;text-align: center;">NV</p></td>
        <td style="width:100pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 5pt;padding-left: 19pt;text-indent: 0pt;text-align: left;">Số Hóa đơn</p></td>
        <td style="width:72pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 21pt;text-indent: 0pt;text-align: left;">Tiền hàng</p></td>
        <td style="width:61pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 9pt;text-indent: 0pt;text-align: left;">Chiết khấu</p></td>
        <td style="width:63pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 10pt;text-indent: 0pt;text-align: left;">Thu thêm</p></td>
        <td style="width:59pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 13pt;text-indent: 0pt;text-align: left;">Thực thu</p></td>
        <td style="width:55pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 10pt;text-indent: 0pt;text-align: left;">Còn lại</p></td>
        </tr>
    <tr style="height:18pt">
        <td style="width:22pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 2pt;text-indent: 0pt;text-align: center;">1</p></td>
        <td style="width:27pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 2pt;padding-left: 3pt;padding-right: 2pt;text-indent: 0pt;text-align: center;">011</p></td>
        <td style="width:42pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 2pt;padding-left: 4pt;padding-right: 2pt;text-indent: 0pt;text-align: center;">0:04:00</p></td>
        <td style="width:41pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 2pt;padding-left: 2pt;padding-right: 1pt;text-indent: 0pt;text-align: center;">0:04:41</p></td>
        <td style="width:24pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s4" style="padding-top: 2pt;padding-left: 1pt;text-indent: 0pt;text-align: center;">nv</p></td>
        <td style="width:100pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 2pt;padding-left: 3pt;text-indent: 0pt;text-align: left;">HBL/08/05/24_0001</p></td>
        <td style="width:72pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">520,000</p></td>
        <td style="width:61pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:63pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-right: 3pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:59pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 2pt;padding-right: 1pt;text-indent: 0pt;text-align: right;">520,000</p></td>
        <td style="width:55pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 3pt;padding-right: 11pt;text-indent: 0pt;text-align: right;">0</p></td>
        </tr>
    <tr style="height:18pt">
        <td style="width:22pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 2pt;text-indent: 0pt;text-align: center;">2</p></td>
        <td style="width:27pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 3pt;padding-left: 3pt;padding-right: 2pt;text-indent: 0pt;text-align: center;">012</p></td>
        <td style="width:42pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 3pt;padding-left: 4pt;padding-right: 2pt;text-indent: 0pt;text-align: center;">0:04:00</p></td>
        <td style="width:41pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 3pt;padding-left: 2pt;padding-right: 1pt;text-indent: 0pt;text-align: center;">0:05:10</p></td>
        <td style="width:24pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s4" style="padding-top: 3pt;padding-left: 1pt;text-indent: 0pt;text-align: center;">nv</p></td>
        <td style="width:100pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 3pt;padding-left: 3pt;text-indent: 0pt;text-align: left;">HBL/08/05/24_0002</p></td>
        <td style="width:72pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">300,000</p></td>
        <td style="width:61pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:63pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-right: 3pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:59pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 3pt;padding-right: 1pt;text-indent: 0pt;text-align: right;">300,000</p></td>
        <td style="width:55pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-right: 11pt;text-indent: 0pt;text-align: right;">0</p></td>
        </tr>
 
    <tr style="height:15pt">
        <td style="width:256pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt" colspan="6"><p class="s5" style="padding-top: 2pt;padding-right: 5pt;text-indent: 0pt;text-align: right;">Tổng cộng</p></td>
        <td style="width:72pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">820,000</p></td>
        <td style="width:61pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:63pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 3pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:59pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 1pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">820,000</p></td>
        <td style="width:55pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p style="text-indent: 0pt;text-align: left;"><br /></p></td>
        </tr> 
         <tr style="height:15pt">
        <td style="width:256pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt" colspan="6"><p class="s5" style="padding-top: 2pt;padding-right: 5pt;text-indent: 0pt;text-align: right;">Tổng Thu</p></td>
        <td style="width:72pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0,000</p></td>
        <td style="width:61pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:63pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 3pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:59pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 1pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:55pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p style="text-indent: 0pt;text-align: left;"><br /></p></td>
        </tr>  
         <tr style="height:15pt">
        <td style="width:256pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt" colspan="6"><p class="s5" style="padding-top: 2pt;padding-right: 5pt;text-indent: 0pt;text-align: right;">Tổng Chi</p></td>
        <td style="width:72pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0,000</p></td>
        <td style="width:61pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:63pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 3pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:59pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 1pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:55pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p style="text-indent: 0pt;text-align: left;"><br /></p></td>
        </tr>  

         <tr style="height:15pt">
        <td style="width:256pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt" colspan="6"><p class="s5" style="padding-top: 2pt;padding-right: 5pt;text-indent: 0pt;text-align: right;">Doanh thu sau chiết khấu - Tổng phát sinh</p></td>
        <td style="width:72pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0,000</p></td>
        <td style="width:61pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:63pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 2pt;padding-right: 3pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:59pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 1pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">0</p></td>
        <td style="width:55pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p style="text-indent: 0pt;text-align: left;"><br /></p></td>
        </tr>  

        
        </table>

            <br />

            <table>
                <tr>
                    <td>
                        <h2 style="padding-top: 3pt;padding-left: 57pt;text-indent: 0pt;text-align: left;">Kê toán trưởng</h2>
                        <p style="padding-top: 6pt;padding-left: 58pt;text-indent: 0pt;text-align: left;">(Ký, ghi rõ họ tên)</p>
                    </td>
                    <td>
                        <h2 style="padding-top: 3pt;padding-left: 55pt;text-indent: 0pt;text-align: center;">Thủ trưởng đơn vị</h2>
                        <p style="padding-top: 6pt;padding-left: 55pt;text-indent: 0pt;text-align: center;">(Ký, ghi rõ họ tên)</p>
                    </td>
                    <td>
                        <h2 style="padding-top: 3pt;padding-left: 57pt;text-indent: 0pt;text-align: left;">Thủ kho</h2>
                        <p style="padding-top: 6pt;padding-left: 58pt;text-indent: 0pt;text-align: left;">(Ký, ghi rõ họ tên)</p>
                    </td>
                    <td>
                        <h2 style="padding-top: 3pt;padding-left: 55pt;text-indent: 0pt;text-align: center;">Thu ngân</h2>
                        <p style="padding-top: 6pt;padding-left: 55pt;text-indent: 0pt;text-align: center;">(Ký, ghi rõ họ tên)</p>
                    </td>
                </tr>
            </table>
            <br />
            
            


        </div>
    </form>
</body>
</html>
