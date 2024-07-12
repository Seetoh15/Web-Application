<%@ Page Title="" Language="C#" MasterPageFile="~/Guest/template.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WAPP_Assignment.Guest.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="login.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container"> 
        <h2 class="login-title">User Login</h2>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="pwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>

        <asp:Label ID="errorMsg" runat="server" CssClass="error-message" Text="Lorem Ipsum" Visible="False"></asp:Label>
        <br />

        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="login-button" OnClick="Button1_Click" />
        <br />

        <div class="signup-link">
            <asp:Label ID="Label4" runat="server" Text="Do not have an account?"></asp:Label>
            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="signup-button">Sign Up</asp:LinkButton>
        </div>
    </div>
</asp:Content>
