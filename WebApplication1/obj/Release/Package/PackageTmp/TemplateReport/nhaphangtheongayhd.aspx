﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nhaphangtheongayhd.aspx.cs" Inherits="WebApplication1.TemplateReport.nhaphangtheongayhd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Báo cáo nhập hàng theo hóa đơn</title>
     <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            text-indent: 0;
        }

        h2 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 8.5pt;
        }

        .s1 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: normal;
            text-decoration: none;
            font-size: 8.5pt;
        }

        .s2 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: normal;
            text-decoration: none;
            font-size: 7pt;
        }

        h1 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: normal;
            font-weight: bold;
            text-decoration: none;
            font-size: 12pt;
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
            font-family: "Times New Roman", serif;
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
            vertical-align: 1pt;
        }

        .s6 {
            color: black;
            font-family: Arial, sans-serif;
            font-style: italic;
            font-weight: bold;
            text-decoration: none;
            font-size: 8pt;
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

    <h2 style="padding-top: 4pt;padding-left: 10pt;text-indent: 0pt;text-align: left;"><%=tendovi %></h2>
    <p class="s1" style="padding-top: 7pt;padding-left: 10pt;text-indent: 0pt;text-align: left;">Địa chỉ: <%=diachidonvi %></p>    
    <p class="s1" style="padding-top: 7pt;padding-left: 10pt;text-indent: 0pt;text-align: left;">Điện thoại: <%=sodtdonvi %></p> 
    
    <p style="padding-left: 7pt;text-indent: 0pt;line-height: 1pt;text-align: left;" />
    <h1 style="padding-top: 6pt;padding-left: 11pt;text-indent: 0pt;text-align: left;">Báo cáo nhập hàng theo hóa đơn <br /><span class="s1">Từ ngày :<%=tungay %> Đến ngày :<%=denngay %></span></h1>
             
    <p style="padding-top: 3pt;text-indent: 0pt;text-align: left;"><br /></p>
    <table style="border-collapse:collapse;margin-left:6.2pt" cellspacing="0">
    <tr style="height:27pt">
        <td style="width:22pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 4pt;text-indent: 0pt;text-align: center;">STT</p></td>
        <td style="width:48pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 7pt;padding-left: 3pt;text-indent: 0pt;text-align: center;">Ngày</p></td>
        <td style="width:90pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 24pt;text-indent: 0pt;text-align: left;">Số hóa đơn</p></td>
        <td style="width:157pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 6pt;padding-left: 52pt;text-indent: 0pt;text-align: left;">Nhà cung cấp</p></td>
        <td style="width:71pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 6pt;padding-left: 16pt;text-indent: 0pt;text-align: left;">Tiền hàng</p></td>
        <td style="width:64pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 5pt;padding-left: 11pt;text-indent: 0pt;text-align: left;">Chiết khấu</p></td>
        <td style="width:59pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 5pt;padding-left: 13pt;text-indent: 0pt;text-align: left;">Thực Chi</p></td>
        <td style="width:55pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:2pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 6pt;padding-left: 15pt;text-indent: 0pt;text-align: left;">Còn lại</p></td>
        </tr>
         <%int tongtienhang = 0; %>
        <%int tongchietkhau = 0; %>
        <%int tongthucthu = 0; %>
        <%int tongpsno = 0; %>
         <%for (int j = 0; j < dt_report.Rows.Count-1; j++)                                                
                                                {%>   
                                
         <%tongtienhang = tongtienhang+ Int32.Parse(dt_report.Rows[j][4].ToString());%>
        <%tongchietkhau = tongchietkhau+ Int32.Parse(dt_report.Rows[j][5].ToString());%>
         <%tongthucthu = tongthucthu+ Int32.Parse(dt_report.Rows[j][6].ToString());%>
        <%tongpsno = tongpsno+ Int32.Parse(dt_report.Rows[j][8].ToString());%>

    <tr style="height:18pt">
        <td style="width:22pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 3pt;text-indent: 0pt;text-align: center;"><%=j %></p></td>
        <td style="width:100pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s4" style="padding-top: 2pt;padding-left: 4pt;text-indent: 0pt;text-align: center;"><%=dt_report.Rows[j][9].ToString()%></p></td>
        <td style="width:90pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 3pt;padding-left: 2pt;text-indent: 0pt;text-align: left;"><%=dt_report.Rows[j][1].ToString()%></p></td>
        <td style="width:105pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s4" style="padding-top: 4pt;padding-left: 1pt;text-indent: 0pt;text-align: left;"><%=dt_report.Rows[j][2].ToString()%></p></td>
        <td style="width:71pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;padding-left: 42pt;text-indent: 0pt;text-align: left;"><%=dt_report.Rows[j][4].ToString()%></p></td>
        <td style="width:64pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 5pt;padding-right: 2pt;text-indent: 0pt;text-align: right;"><%=dt_report.Rows[j][5].ToString()%></p></td>
        <td style="width:59pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 5pt;padding-right: 2pt;text-indent: 0pt;text-align: right;"><%=dt_report.Rows[j][6].ToString()%></p></td>
        <td style="width:55pt;border-top-style:solid;border-top-width:2pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s3" style="padding-top: 4pt;text-indent: 0pt;text-align: right;"><%=dt_report.Rows[j][8].ToString()%></p></td>
        </tr>

         <%} %>
    <tr style="height:19pt">
        <td style="width:388pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt" colspan="5"><p class="s5" style="padding-top: 3pt;padding-right: 2pt;text-indent: 0pt;text-align: right;">Tổng cộng: <span class="s6"><%=String.Format("{0:N0}", tongtienhang) %></span></p></td>
        <td style="width:64pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 4pt;padding-right: 1pt;text-indent: 0pt;text-align: right;"><%=String.Format("{0:N0}", tongchietkhau) %></p></td>
        <td style="width:59pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 4pt;padding-right: 1pt;text-indent: 0pt;text-align: right;"><%=String.Format("{0:N0}", tongthucthu) %></p></td>
        <td style="width:55pt;border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt"><p class="s6" style="padding-top: 4pt;padding-right: 2pt;text-indent: 0pt;text-align: right;"><%=String.Format("{0:N0}", tongpsno) %></p></td>
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
