<%@ Page Title="" Language="C#" MasterPageFile="~/Guest/template.Master" AutoEventWireup="true" CodeBehind="signIn.aspx.cs" Inherits="WAPP_Assignment.Guest.signIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="signIn.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .auto-style2 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="signupContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h2 class="login-title">Sign Up</h2>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="name" 
                ErrorMessage="Name is required!" Display="Dynamic" CssClass="error-message"></asp:RequiredFieldValidator>
        </div>


        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="username" ErrorMessage="Username is required!" Display="Dynamic" CssClass="error-message"></asp:RequiredFieldValidator>
        </div>


        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="email"  ErrorMessage="Email is required!" Display="Dynamic" CssClass="error-message"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="email" 
                ErrorMessage="Invalid email format!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                Display="Dynamic" CssClass="error-message"></asp:RegularExpressionValidator>
        </div>


        <div class="form-group">
            <asp:Label ID="Label5" runat="server" Text="Country:"></asp:Label>
            <asp:TextBox ID="country" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ControlToValidate="country" ErrorMessage="Country is required!" Display="Dynamic" CssClass="error-message"></asp:RequiredFieldValidator>
        </div>


        <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Gender:"></asp:Label>
            <asp:DropDownList ID="gender" runat="server" CssClass="auto-style1" Width="416px">
                <asp:ListItem Text="Male" Value="male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="female"></asp:ListItem>
            </asp:DropDownList>
        </div>


        <div class="form-group">
            <asp:Label ID="Label7" runat="server" Text="Select your role:"></asp:Label>
            <asp:DropDownList ID="user_type" runat="server" CssClass="auto-style1" Width="416px">
                <asp:ListItem Value="Educator">Educator</asp:ListItem>
                <asp:ListItem Value="Member">Member</asp:ListItem>
                <asp:ListItem Value="Admin">Admin</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label ID="Label8" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="password" ErrorMessage="Password is required!" Display="Dynamic" CssClass="error-message"></asp:RequiredFieldValidator>
        </div>

        <asp:Label ID="ErrorMsg" runat="server" CssClass="error-message"></asp:Label>
        <asp:Label ID="SuccessMsg" runat="server" CssClass="success-message" Visible="false"></asp:Label> 
        <br />

        <asp:Button ID="signup" runat="server" Text="Sign Up" CssClass="auto-style2" OnClick="ButtonSignup_Click" Width="400px" />
        <br />
        
        <div class="signup-link">
            <asp:Label ID="Label10" runat="server" Text="Already have an account?"></asp:Label>
            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CausesValidation="false">Log In</asp:LinkButton>
        &nbsp;</div>
    </div>
</asp:Content>


