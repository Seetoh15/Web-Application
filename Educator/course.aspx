<%@ Page Title="" Language="C#" MasterPageFile="~/Educator/template.Master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="WAPP_Assignment.Educator.course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Course Selection</title>
    <link rel="stylesheet" href="course.css" />
    <script src="course.js" defer></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="selection-container">
        <h1>Select a Course</h1>
        <a id="course1Button" href="courseContent.aspx?course_id=1" class="course-button">English</a>
        <a id="course2Button" href="courseContent.aspx?course_id=2" class="course-button">Mathematics</a>
    </div>
</asp:Content>