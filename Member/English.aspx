<%@ Page Title="" Language="C#" MasterPageFile="~/template.Master" AutoEventWireup="true" CodeBehind="English.aspx.cs" Inherits="WAPP_Assignment.Member.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to English Course</title>
    <link rel="stylesheet" href="english.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="centered-form">
        <h1>Learning Materials</h1><br>
        <a href="Chapters/chapters.html?chapter=Chapter1">Chapter 1</a><br><br>
        <a href="Chapters/chapters.html?chapter=Chapter2">Chapter 2</a><br><br>
        <a href="Chapters/chapters.html?chapter=Chapter3">Chapter 3</a><br><br>
    </div>
</asp:Content>
