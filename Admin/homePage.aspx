<%@ Page Title="" Language="C#" MasterPageFile="template.Master" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="WAPP_Assignment.Admin.createProfileEdu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="homePage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container1">
        <h2>Dashboard</h2>
        <a href="#" class="button"><i class="fas fa-download fa-sm"></i>Generate Report</a>
    </div>
    <!-- Earnings (Monthly) Card Example -->
    <div class="container">
        <!-- First Column -->
        <div class="column">
            <div class="card border-left-success">
                <div class="card-body">
                    <div>
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            Students
                        </div>
                        <div class="h5 mb-0 font-weight-bold">
                            0
                        </div>
                    </div>
                    <div>
                        <i class="fas fa-dollar-sign fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
        <!-- Second Column -->
        <div class="column">
            <div class="card border-left-info">
                <div class="card-body">
                    <div>
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                            Projects
                        </div>
                        <div class="h5 mb-0 font-weight-bold">
                            120
                        </div>
                    </div>
                    <div>
                        <i class="fas fa-clipboard-list fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
        <!-- Third Column -->
        <div class="column">
            <div class="card border-left-warning">
                <div class="card-body">
                    <div>
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                            Tasks
                        </div>
                        <div class="h5 mb-0 font-weight-bold">
                            24
                        </div>
                    </div>
                    <div>
                        <i class="fas fa-tasks fa-2x"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="charts">

        <div class="charts-card">
            <p class="chart-title">Total Users</p>
            <div id="bar-chart"></div>
        </div>

        <div class="charts-card">
            <p class="chart-title">Testing</p>
            <div id="area-chart"></div>
        </div>

    </div>

    <!-- FontAwesome script and Charts-->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.50.0/apexcharts.min.js"></script>

    <!-- Custom JS -->
    <script src="homePage.js"></script>

</asp:Content>

