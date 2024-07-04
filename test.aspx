<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="WAPP_Assignment.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
        <header id="header">
<h1>Welcome to Test Website</h1>
</header>
<nav id="nav">
<ul>
<li><a href="home.aspx">Home</a></li>
<li><a href="#">About</a></li>
<li><a href="#">Article</a></li>
<li><a href="#">Contact</a></li>
</ul>
</nav>
<div id="side">
<h1>news</h1>
<a href="#"><p>Develop Assignment Project</p></a>
<a href="#"><p>Learn CSS</p></a>
<a href="#">Learn ASP.Net</a>
</div>
<p id="con">
<asp:ContentPlaceHolder ID="ContentPlaceHolder2" runat="server">
</asp:ContentPlaceHolder>
</p>
<footer id="footer">
        copyright @WAPP-LAB-AFFENDY
</footer>
</body>
</html>
