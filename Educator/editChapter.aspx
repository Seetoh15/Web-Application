<%@ Page Title="" Language="C#" MasterPageFile="~/Educator/template.Master" AutoEventWireup="true" CodeBehind="editChapter.aspx.cs" Inherits="WAPP_Assignment.Educator.editChapter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="addLearningMaterial.css" rel="stylesheet" />
    <script>
        function confirmPostDeletion() {
            return confirm("Are you sure you want to delete this chapter?");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="popup" class="popup">
        <div class="popup-content">
            <h2>Edit Chapter</h2>
            <asp:Button ID="btnRemove" CssClass="btnRemove" runat="server" Text="Delete Chapter" OnClick="DeleteChapter" OnClientClick="return confirmPostDeletion();" />
            <div class="form-group">
                <asp:TextBox ID="txtTopic" runat="server" Placeholder="Topic" CssClass="form-control"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title is required!" ControlToValidate="txtTitle" CssClass="error-message"></asp:RequiredFieldValidator>--%>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Upload PDF:"></asp:Label>
                <asp:Label ID="lblFile" runat="server" Text=""></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control-file" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
