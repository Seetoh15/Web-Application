<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/template.Master" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="WAPP_Assignment.Admin.createProfileEdu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="homePage.css">
    <link rel="stylesheet" href="allUserDetails.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
        <h2>Dashboard</h2>
        <asp:LinkButton ID="btnGenerateReport" runat="server" CssClass="button" OnClick="btnGenerateReport_Click">
    <i class="fas fa-download fa-sm"></i>Show Report
        </asp:LinkButton>
    </div>
    <!-- Earnings (Monthly) Card Example -->
    <div class="container">
        <!-- First Column -->
        <div class="column">
            <div class="card border-left-success">
                <div class="card-body">
                    <div>
                        <div class="text-students">
                            Members
                        </div>
                        <div class="font-weight">
                            <asp:Label ID="lblmemberCount" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>
                    <div>
                        <!--Icon from font awesome-->
                        <i class="fas fa-solid fa-user fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
        <!-- Second Column -->
        <div class="column">
            <div class="card border-left-info">
                <div class="card-body">
                    <div>
                        <div class="text-students text-info">
                            Educators
                        </div>
                        <div class="font-weight">
                            <asp:Label ID="lbleducatorCount" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>
                    <div>
                        <!--Icon from font awesome-->
                        <i class=" fas fa-solid fa-book fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
        <!-- Third Column -->
        <div class="column">
            <div class="card border-left-warning">
                <div class="card-body">
                    <div>
                        <div class="text-students text-warning">
                            Admins
                        </div>
                        <div class="font-weight">
                            <asp:Label ID="lbladminCount" runat="server" Text="0"></asp:Label>
                        </div>
                    </div>
                    <div>
                        <!--Icon from font awesome-->
                        <i class="fas fa-solid fa-user fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <h2>Pending Admin/Educator user</h2>
    <div class="header_fixed thead th small-table-container">
        <asp:GridView ID="PendingUsersGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="PendingUsersGridView_RowCommand" EmptyDataText="No pending users found.">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="User_Type" HeaderText="User Type" />
                <asp:TemplateField HeaderText="Approve">
                    <ItemTemplate>
                        <asp:Button ID="ApproveButton" runat="server" CommandName="Approve" CommandArgument='<%# Eval("ID") %>' Text="Approve"
                            OnClientClick="return confirm('Are you sure you want to approve this user?');" CssClass="search-button" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Reject">
                    <ItemTemplate>
                        <asp:Button ID="RejectButton" runat="server" CommandName="Reject" CommandArgument='<%# Eval("ID") %>' Text="Reject"
                            OnClientClick="return confirm('Are you sure you want to reject this user?');" CssClass="search-button" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>


</asp:Content>

