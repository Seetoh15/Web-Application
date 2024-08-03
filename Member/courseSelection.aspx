<%@ Page Title="" Language="C#" MasterPageFile="~/Member/template.Master" AutoEventWireup="true" CodeBehind="courseSelection.aspx.cs" Inherits="WAPP_Assignment.Member.courseSelection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Course Selection</title>
    <link rel="stylesheet" href="course.css" />
    <script src="course.js" defer></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="selection-container">
        <h1>Select a Course</h1>
        <a id="course1Button" href="English.aspx" class="course-button">English</a>
        <a id="course2Button" href="math.aspx" class="course-button">Mathematics</a>
    </div>
</asp:Content>
