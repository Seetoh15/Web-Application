<%@ Page Title="" Language="C#" MasterPageFile="~/Member/template.Master" AutoEventWireup="true" CodeBehind="postForum.aspx.cs" Inherits="WAPP_Assignment.Member.postForum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Post Forum</title>
    <link rel="stylesheet" href="postForum.css" />
    <script src="postForum.js" defer></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="forum-container">
        <h1>Post Forum</h1>
        <div class="post-form">
            <label for="txtTitle">Title:</label>
            <input type="text" id="txtTitle" class="input-box">
            <br />
            <label for="txtContent">Content:</label>
            <textarea id="txtContent" class="input-box"></textarea>
            <br />
            <button id="btnSubmit" class="btn">Submit</button>
        </div>
        <hr />
        <div class="posts-list" id="postsList">
        </div>
    </div>
</asp:Content>
