<%@ Page Title="" Language="C#" MasterPageFile="~/Guest/template.Master" AutoEventWireup="true" CodeBehind="signIn.aspx.cs" Inherits="WAPP_Assignment.Guest.signIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="signIn.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="signupContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h2 class="login-title">Sign Up</h2>

        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
            <asp:TextBox ID="fname" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
            <asp:TextBox ID="lname" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Gender:"></asp:Label>
            <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal" CssClass="form-control" AutoPostBack="True">
                <asp:ListItem Text="Male" Value="male" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Female" Value="female"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
       

        <div class="form-group">
            <asp:Label ID="Label5" runat="server" Text="Country:"></asp:Label>
            <asp:TextBox ID="country" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
   
        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    
        <div class="form-group">
            <asp:Label ID="Label7" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="pwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>

        <asp:Label ID="ErrorMsg" runat="server" CssClass="error-message"></asp:Label>
        <asp:Label ID="usertype" runat="server" Text=""></asp:Label>
        <br />

        <asp:Button ID="signup" runat="server" Text="Sign Up" CssClass="login-button" OnClick="ButtonSignup_Click" />
        <br />
        
        <div class="signup-link">
            <asp:Label ID="Label9" runat="server" Text="Already have an account?"></asp:Label>
            &nbsp;
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Log In</asp:LinkButton>
        </div>
    </div>
</asp:Content>

