<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/template.Master" AutoEventWireup="true" CodeBehind="adminDetails.aspx.cs" Inherits="WAPP_Assignment.Admin.admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Details</title>
    <link rel="stylesheet" href="allUserDetails.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-header">
        <h2>Admin Details</h2>
        <div class="search-container">
            <input type="text" placeholder="Search.." name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
        </div>
    </div>
    <div class="header_fixed">
        <table>
            <thead>
                <tr>
                    <th>Profile pic</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Country</th>
                    <th>Gender</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><img src="#" /></td>
                    <td>2</td>
                    <td>22</td>
                    <td>2</td>
                    <td>2</td>
                    <td>2</td>
                    <td><button>Delete</button></td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
