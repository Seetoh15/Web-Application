<%@ Page Title="" Language="C#" MasterPageFile="~/Member/template.Master" AutoEventWireup="true" CodeBehind="english.aspx.cs" Inherits="WAPP_Assignment.Member.english" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to English Course</title>
    <link rel="stylesheet" href="english.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>English Course</h1>
    <div class="centered-form">
        <h1>Learning Materials</h1><br>
        <a href="echapters/echapters.html?chapter=echapter1">Chapter 1</a><br><br>
        <a href="echapters/echapters.html?chapter=echapter2">Chapter 2</a><br><br>
        <a href="echapters/echapters.html?chapter=echapter3">Chapter 3</a><br><br>
    </div>
    <div class="centered-form">
        <h1>Quiz</h1><br>
        <a href="englishQuiz.aspx">Take Quiz</a><br><br>
    </div>
</asp:Content>
