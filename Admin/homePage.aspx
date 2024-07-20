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
        <a href="#" class="button"><i class="fas fa-download fa-sm"></i>Generate Report</a>
    </div>
    <!-- Earnings (Monthly) Card Example -->
    <div class="container">
        <!-- First Column -->
        <div class="column">
            <div class="card border-left-success">
                <div class="card-body">
                    <div>
                        <div class="text-students">
                            Students
                        </div>
                        <div class="font-weight">
                            0
                        </div>
                    </div>
                    <div>
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
                            Projects
                        </div>
                        <div class="font-weight">
                            0
                        </div>
                    </div>
                    <div>
                        <i class=" fas fa-solid fa-book fa-2x" ></i>
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
                            Tasks
                        </div>
                        <div class="font-weight">
                            0
                        </div>
                    </div>
                    <div>
                        <i class="fas fa-solid fa-comment fa-2x"></i>
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

    </div>

    <div class="header_fixed small-table-container">
        <table>
            <thead>
                <tr>
                    <th>Profile pic</th>
                    <th>Name</th>
                    <th>Name</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><img src="#" /></td>
                    <td><button>Delete</button></td>
                    <td><button>Delete</button></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- FontAwesome script and Charts-->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.50.0/apexcharts.min.js"></script>

    <!-- Custom JS -->
    <script src="homePage.js"></script>

</asp:Content>

