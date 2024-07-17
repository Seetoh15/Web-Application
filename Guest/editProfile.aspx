<%@ Page Title="" Language="C#" MasterPageFile="~/template.Master" AutoEventWireup="true" CodeBehind="editProfile.aspx.cs" Inherits="WAPP_Assignment.Guest.editProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="editProfile.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="editprofileContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <h2 class="profile-title">Edit Profile</h2>

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
            <asp:DropDownList ID="gender" runat="server" CssClass="form-control" AutoPostBack="True">
                <asp:ListItem Text="Male" Value="male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="female"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label ID="Label7" runat="server" Text="Select your role:"></asp:Label>
            <asp:DropDownList ID="user_type" runat="server" CssClass="form-control" AutoPostBack="True">
                <asp:ListItem Value="Educator">Educator</asp:ListItem>
                <asp:ListItem Value="Member">Member</asp:ListItem>
                <asp:ListItem Value="Admin">Admin</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <asp:Label ID="Label8" runat="server" Text="Password:"></asp:Label>
            <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
        </div>

        <div class="form-group">
             <asp:Label ID="img" runat="server" Text="Profile picture"></asp:Label>
               <asp:FileUpload ID="FileUpload1" runat="server" />
             <br />
        </div>

        <asp:Image ID="profile_pic" runat="server" Height="240px" Width="289px" />

        <asp:Label ID="ErrorMsg" runat="server" CssClass="error-message"></asp:Label>
        <br />

        <asp:Button ID="save" runat="server" Text="Save Profile" CssClass="save-button" OnClick="ButtonSaveProfile_Click" />
        <br />

        <div class="signup-link">
            <asp:Label ID="Label10" runat="server" Text="Return to"></asp:Label>
            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Home</asp:LinkButton>
        </div>
    </div>
</asp:Content>
