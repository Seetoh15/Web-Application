<%@ Page Title="" Language="C#" MasterPageFile="~/Educator/template.Master" AutoEventWireup="true" CodeBehind="courseContent.aspx.cs" Inherits="WAPP_Assignment.Educator.courseContent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Welcome to <%= course_subject %> Course</title>
    <link rel="stylesheet" href="courseContent.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1><%= course_subject %> Course</h1>
    <div class="popupBtnContainer">
        <asp:Button ID="Button1" runat="server" Text="Add Learning Material" CssClass="popupBtn" OnClick="Button1_Click"/>
    </div>
    <div class="centered-form">
        <h1>Learning Materials</h1><br>
        <asp:Repeater ID="ChapterRepeater" runat="server">
            <ItemTemplate>
                <a href="editChapter.aspx?chapter_id=<%# Eval("chapter_id") %>"><%# Eval("topic") %></a><br><br>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="popupBtnContainer">
        <asp:Button ID="Button2" runat="server" Text="Add Quiz" CssClass="popupBtn" OnClick="Button2_Click" style="margin-top:100px;" />
    </div>
    <div class="centered-form">
        <h1>Quiz</h1><br>
        <asp:Repeater ID="QuizRepeater" runat="server">
            <ItemTemplate>
                <a href="editQuiz.aspx?quiz_id=<%# Eval("quiz_id") %>"><%# Eval("title") %></a><br><br>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
