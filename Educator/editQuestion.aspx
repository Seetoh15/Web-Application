<%@ Page Title="" Language="C#" MasterPageFile="~/Educator/template.Master" AutoEventWireup="true" CodeBehind="editQuestion.aspx.cs" Inherits="WAPP_Assignment.Educator.editQuestion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="editQuestion.css" />
    <script>
        function confirmQuestionDeletion() {
            return confirm("Are you sure you want to delete this question?");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="popup" class="popup">
        <div class="popup-content">
            <asp:Button ID="btnRemove" CssClass="btnRemove" runat="server" Text="Delete Question" OnClick="btnRemove_Click" OnClientClick="return confirmQuestionDeletion();" />
            <h2>Edit Question</h2>
            <div class="form-group">
                <asp:TextBox ID="txtQuestion" runat="server" Placeholder="Question" CssClass="form-control"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title is required!" ControlToValidate="txtTitle" CssClass="error-message"></asp:RequiredFieldValidator>--%>
            </div>
            <div style="display:flex; flex-direction:column; margin-bottom:15px; gap:10px;">
                <div>
                    <asp:TextBox ID="TextBox1" runat="server" Placeholder="Option 1" CssClass="form-control"></asp:TextBox>
                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="choice" />
                    <asp:Label ID="Label1" runat="server" Text="Correct"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="TextBox2" runat="server" Placeholder="Option 2" CssClass="form-control"></asp:TextBox>
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="choice" />
                    <asp:Label ID="Label2" runat="server" Text="Correct"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="TextBox3" runat="server" Placeholder="Option 3" CssClass="form-control"></asp:TextBox>
                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="choice" />
                    <asp:Label ID="Label3" runat="server" Text="Correct"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="TextBox4" runat="server" Placeholder="Option 4" CssClass="form-control"></asp:TextBox>
                    <asp:RadioButton ID="RadioButton4" runat="server" GroupName="choice" />
                    <asp:Label ID="Label4" runat="server" Text="Correct"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
