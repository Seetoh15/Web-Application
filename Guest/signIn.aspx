<%@ Page Title="" Language="C#" MasterPageFile="~/Guest/template.Master" AutoEventWireup="true" CodeBehind="signIn.aspx.cs" Inherits="WAPP_Assignment.Guest.signIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="signIn.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="signupContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h2 class="login-title">Sign Up</h2>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    
        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label5" runat="server" Text="Country:"></asp:Label>
            <asp:TextBox ID="country" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Gender:"></asp:Label>
            <asp:DropDownList ID="gender" runat="server" CssClass="auto-style1" Width="416px" AutoPostBack="True">
                <asp:ListItem Text="Male" Value="male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="female"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label ID="Label7" runat="server" Text="Select your role:"></asp:Label>
            <asp:DropDownList ID="user_type" runat="server" CssClass="auto-style1" Width="416px" AutoPostBack="True">
                <asp:ListItem Value="Educator">Educator</asp:ListItem>
                <asp:ListItem Value="Member">Member</asp:ListItem>
                <asp:ListItem Value="Admin">Admin</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label ID="Label8" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>

        <asp:Label ID="ErrorMsg" runat="server" CssClass="error-message"></asp:Label>
        <br />

        <asp:Button ID="signup" runat="server" Text="Sign Up" CssClass="login-button" OnClick="ButtonSignup_Click" />
        <br />
        
        <div class="signup-link">
            <asp:Label ID="Label10" runat="server" Text="Already have an account?"></asp:Label>
            &nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Log In</asp:LinkButton>
        </div>
    </div>
</asp:Content>
