<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/template.Master" AutoEventWireup="true" CodeBehind="generateReportAdmin.aspx.cs" Inherits="WAPP_Assignment.Admin.generateReportAdmin" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="generateReportAdmin.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>LearnHub Report</h2>
        <div class="report-info">
            <div class="report-date">
                <br />
                <strong>Date Created : &nbsp&nbsp</strong>
                <asp:Label ID="lblDateCreated" runat="server"></asp:Label>
            </div>
            <div class="admin-info">
                <br />
                <strong>Admin Username : &nbsp&nbsp</strong>
                <asp:Label ID="lblAdminUsername" runat="server"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Total number of Member : "></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="Total number of Admin : "></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Total number of Educator : "></asp:Label>
                <br />
                <br />
                <h2>Graph of total users </h2>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="500px" Width="500px">
                    <Series>
                        <asp:Series ChartType="Column" Name="Series1" XValueMember="user_type" YValueMembers="UserCount">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT user_type, COUNT(id) AS UserCount FROM [end_user] WHERE user_type IN ('Educator', 'Member', 'Admin') GROUP BY user_type">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Educator" Name="user_type" Type="String" />
                        <asp:Parameter DefaultValue="Member" Name="user_type2" Type="String" />
                        <asp:Parameter DefaultValue="Admin" Name="user_type3" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>


