<%@ Page Title="" Language="C#" MasterPageFile="~/Member/template.Master" AutoEventWireup="true" CodeBehind="math.aspx.cs" Inherits="WAPP_Assignment.Member.math" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to Mathematics Course</title>
    <link rel="stylesheet" href="math.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Mathematics Course</h1>
    <div class="centered-form">
        <h1>Learning Materials</h1><br>
        <a href="mchapters/mchapters.html?chapter=mchapter1">Chapter 1</a><br><br>
        <a href="mchapters/mchapters.html?chapter=mchapter2">Chapter 2</a><br><br>
        <a href="mchapters/mchapters.html?chapter=mchapter3">Chapter 3</a><br><br>
    </div>
    <div class="centered-form">
        <h1>Quiz</h1><br>
        <a href="mathQuiz.aspx">Take Quiz</a><br><br>
    </div>
</asp:Content>
