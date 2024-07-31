<%@ Page Title="" Language="C#" MasterPageFile="~/Educator/template.Master" AutoEventWireup="true" CodeBehind="addQuiz.aspx.cs" Inherits="WAPP_Assignment.Educator.addQuiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="addLearningMaterial.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="popup" class="popup">
        <div class="popup-content">
            <h2>Add Quiz</h2>
            <div class="form-group">
                <asp:TextBox ID="txtTitle" runat="server" Placeholder="Title" CssClass="form-control"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title is required!" ControlToValidate="txtTitle" CssClass="error-message"></asp:RequiredFieldValidator>--%>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
