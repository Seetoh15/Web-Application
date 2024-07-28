<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/template.Master" AutoEventWireup="true" CodeBehind="editProfileAdmin.aspx.cs" Inherits="WAPP_Assignment.Admin.editProfileAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="editProfileAdmin.css" rel="stylesheet" />
    <title>Edit User Profile</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <h2 class="profile-title">Edit Profile</h2>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ErrorMessage="Name is required!" CssClass="error-message" ControlToValidate="name"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Username:"></asp:Label>
            <asp:TextBox ID="username" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
        </div>
    
        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" CssClass="error-message" Display="Dynamic" ErrorMessage="Email is required!"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" CssClass="error-message" Display="Dynamic" ErrorMessage="Invalid email format!" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="Label5" runat="server" Text="Country:"></asp:Label>
            <asp:TextBox ID="country" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="country" CssClass="error-message" Display="Dynamic" ErrorMessage="Country is required!"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Gender:"></asp:Label>
            <asp:DropDownList ID="gender" runat="server" CssClass="form-control" AutoPostBack="True">
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label ID="Label7" runat="server" Text="Role:"></asp:Label>
            <asp:DropDownList ID="user_type" runat="server" CssClass="form-control" AutoPostBack="True" Enabled="False">
                <asp:ListItem Value="Educator">Educator</asp:ListItem>
                <asp:ListItem Value="Member">Member</asp:ListItem>
                <asp:ListItem Value="Admin">Admin</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label ID="Label8" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="password" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="password" CssClass="error-message" Display="Dynamic" ErrorMessage="Password is required!"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
             <asp:Label ID="Label11" runat="server" Text="Profile Picture:"></asp:Label>
             <asp:Label ID="img" runat="server" Text="Profile picture"></asp:Label>
               <asp:FileUpload ID="FileUpload1" runat="server" />
             <br />
        </div>

        <asp:Image ID="profile_pic" runat="server" Height="240px" Width="289px" />

        <asp:Label ID="ErrorMsg" runat="server" CssClass="error-message"></asp:Label>
        <asp:Label ID="SuccessMsg" runat="server" CssClass="success-message" Visible="False"></asp:Label>
        <br />

        <asp:Button ID="save" runat="server" Text="Save Profile" CssClass="save-button" OnClick="ButtonSaveProfile_Click" />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Return to previous page</asp:LinkButton>



    </div>
</asp:Content>
