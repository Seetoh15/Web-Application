<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/template.Master" AutoEventWireup="true" CodeBehind="memberDetails.aspx.cs" Inherits="WAPP_Assignment.Admin.memberDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Details</title>
    <link rel="stylesheet" href="allUserDetails.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-header">
       <h2>Member Details</h2>
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
                    <td>1</td>
                    <td><img src="#" /></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><button>View</button></td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
