<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/template.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="WAPP_Assignment.Admin.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Table Design </title>
    <link rel="stylesheet" href="admin.css" />
    <style type="text/css">
        .auto-style1 {
            width: 119px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="header_fixed">
        <table>
            <thead>
                <tr>
                    <th class="auto-style1">S No.</th>
                    <th>Image</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="auto-style1">1</td>
                    <td><img src=https://drive.google.com/thumbnail?id=1qw3KUJnYgvnJHQP-yY13u_rXrJO8ZbL_ /></td>
                    <td>Rakhi Gupta</td>
                    <td>rakhigupta@gmail.com</td>
                    <td>Engineering</td>
                    <td><button>View</button></td>
                </tr>
                <tr>
                    <td class="auto-style1">2</td>
                    <td><img src=https://drive.google.com/thumbnail?id=1KV8Ob2wXIcobIvayGGDB1qUpQn_iZKIp /></td>
                    <td>Anjali</td>
                    <td>anjali@gmail.com</td>
                    <td>Engineering</td>
                    <td><button>View</button></td>
                </tr>
                <tr>
                    <td class="auto-style1">3</td>
                    <td><img src=https://drive.google.com/thumbnail?id=1ock7haLmYaAbHe8yn9H8ZGgkaGY9lcB0 /></td>
                    <td>Vejata Gupta</td>
                    <td>Vejata@gmail.com</td>
                    <td>Engineering</td>
                    <td><button>View</button></td>
                </tr>
                <tr>
                    <td class="auto-style1">4</td>
                    <td><img src=https://drive.google.com/thumbnail?id=1MbkS3AwaCNaKfMTmCQMHD1okQEubCdnt /></td>
                    <td>Shweta</td>
                    <td>Shweta@gmail.com</td>
                    <td>Engineering</td>
                    <td><button>View</button></td>
                </tr>
                <tr>
                    <td class="auto-style1">5</td>
                    <td><img src=https://drive.google.com/thumbnail?id=1oztRYJUSZ5txDbaAAGg0O8_Ek6nzLAId /></td>
                    <td>Adarsh</td>
                    <td>Adarsh@gmail.com</td>
                    <td>Engineering</td>
                    <td><button>View</button></td>
                </tr>
                <tr>
                    <td class="auto-style1">6</td>
                    <td><img src=https://drive.google.com/thumbnail?id=1ysB5QChCSLpz3igUoDzalENFsjJEe8H7 /></td>
                    <td>Monti</td>
                    <td>Monti@gmail.com</td>
                    <td>Engineering</td>
                    <td><button>Delete</button></td>
                </tr>
                <tr>
                    <td class="auto-style1">7</td>
                    <td><img src=https://drive.google.com/thumbnail?id=1fCtvhYFy1roieanYeXua1jKJyfUhiDS6 /></td>
                    <td>Arpit</td>
                    <td>Arpit@gmail.com</td>
                    <td>Engineering</td>
                    <td><button>Delete</button></td>
                </tr>
                <tr>
                    <td class="auto-style1">8</td>
                    <td><img src=https://drive.google.com/thumbnail?id=1ZHPBm7fBxfbW2qV8pLTeDvMreXzqcW-x /></td>
                    <td>Priya</td>
                    <td>priya@gmail.com</td>
                    <td>Engineering</td>
                    <td><button>Delete</button></td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
