<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WAPP_Assignment.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="style.css" />
</head>
<body style="margin:0;">
    <div class="header">
        <div class="logo">
            <div style="width:70px; height:70px;">
                <a href="#">
                    <img src="logo.png" alt=""/>
                </a>
            </div>
        </div>
        <div style="width:80%; height:100%; display:grid; align-items:center;">
            <div style="text-align:right">
                <img src="pp.png" alt="" style="width:50px; height:50px; padding-right:20px;"/>
            </div>
        </div>
    </div>
    <div style="height:90%;display:flex; flex-direction:row;">
        <div class="sidebar">
            <div class="pageList">
                <a class="page" href="#"><i class="fa fa-home"></i>Home</a>
                <%--<a class="page" href="#"><i class="fa fa-home"></i>Home</a>--%>
                <%--<a class="page" href="#"><i class="fa fa-home"></i>Home</a>--%>
                <%--<a class="page" href="#"><i class="fa fa-home"></i>Home</a>--%>
            </div>
        </div>
        <div class="content">
            <%--insert content here--%>
        </div>
    </div>
</body>
</html>
