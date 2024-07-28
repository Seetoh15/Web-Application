<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/template.Master" AutoEventWireup="true" CodeBehind="educatorDetails.aspx.cs" Inherits="WAPP_Assignment.Admin.educatorDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Educators Details</title>
    <link rel="stylesheet" href="allUserDetails.css" />
</asp:Content>
    
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container-header">
        <h2>Educator Details</h2>
            <div class="search-container">
                <asp:TextBox ID="SearchTextBox" runat="server" placeholder="Search.." CssClass="search-input"></asp:TextBox>
                <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" CssClass="search-button" />
            </div>

    </div>
    <div class="header_fixed thead th">
        <asp:GridView ID="PendingUsersGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="PendingUsersGridView_RowCommand" EmptyDataText="No pending users found.">
            <Columns>
                <asp:TemplateField HeaderText="Profile Pic">
                    <ItemTemplate>
                        <asp:Image ID="ProfilePicImage" runat="server" ImageUrl='<%# Eval("profile_pic") %>' Width="60px" Height="60px" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Username">
                    <ItemTemplate>
                        <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("username") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("name") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <asp:Label ID="GenderLabel" runat="server" Text='<%# Eval("gender") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("email") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Country">
                    <ItemTemplate>
                        <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("country") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ID") %>' Text="Edit"
                            OnClientClick="return confirm('Are you sure you want to edit this user?');" CssClass="search-button" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" CommandArgument='<%# Eval("ID") %>' Text="Delete"
                            OnClientClick="return confirm('Are you sure you want to delete this user?'); " CssClass="search-button" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
