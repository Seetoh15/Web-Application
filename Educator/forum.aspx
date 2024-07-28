<%@ Page Title="" Language="C#" MasterPageFile="~/Educator/template.Master" AutoEventWireup="true" CodeBehind="forum.aspx.cs" Inherits="WAPP_Assignment.Educator.forum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="forum.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; gap:20px; padding-top:20px;">
        <div style="display:flex; justify-content:space-between; align-items:center; width: 70%; margin: 20px auto;">
            <div style="display:flex; flex-direction:row; width:50%">
                <div class="search">
                    <span class="search-icon material-symbols-outlined">search</span>
                    <%--<input class="search-input" type="search" placeholder="Search" />--%>
                    <%--<input id="search-input" class="search-input" type="text" placeholder="Search" />--%>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" placeholder="Search"></asp:TextBox>
                </div>
                <asp:Button ID="searchBtn" runat="server" Text="Search" CssClass="search-button" OnClick="searchBtn_Click" />
            </div>
            <button id="popupBtn">Add Post</button>
        </div>
        <div style="width:70%; height:100%; display:flex; flex-direction:column; gap:10px;">
            <asp:Repeater ID="PostsRepeater" runat="server">
                <ItemTemplate>
                    <a href="comment.aspx?post_id=<%# Eval("post_id") %>">
                        <div style="height:150px; display:flex; flex-direction:row; box-shadow:0 4px 8px rgba(0, 0, 0, 0.1); padding:10px; background:white; border-radius:10px;">
                            <div style="display:flex; flex-direction:column; width:75%;">
                                <div style="display:flex; flex-direction:row; margin-top:10px; width:100%;">
                                    <img src="<%# GetProfilePicUrl(Eval("profile_pic")) %>" alt="Profile picture" />
                                    <div style="display:flex; flex-direction:column; margin-left:10px; width:100%;">
                                        <div style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
                                            <b><%# Eval("title") %></b>
                                        </div>
                                        <span style="color:lightslategrey; font-size:13px;">By <%# Eval("username") %> <%# Eval("created_at") %></span>
                                    </div>
                                </div>
                                <div style="margin:20px 0 20px 50px; overflow:hidden; display:-webkit-box; -webkit-line-clamp:3; -webkit-box-orient:vertical;">
                                    <%# Eval("content") %>
                                </div>
                            </div>
                            <div style="width:auto; display:flex; flex-direction:row; width: 25%; justify-content:right; align-items:center; gap:5px; font-size:23px;">
                                <div>
                                    <%# Eval("comment_count") %>
                                </div>
                                <div>
                                    <i class="fa fa-comments"></i>
                                </div>
                            </div>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <div id="popup" class="popup">
        <div class="popup-content">
            <span class="close">&times;</span>
            <h2>Create a New Forum Post</h2>
            <div class="form-group">
                <asp:TextBox ID="txtTitle" runat="server" Placeholder="Title" CssClass="form-control"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Title is required!" ControlToValidate="txtTitle" CssClass="error-message"></asp:RequiredFieldValidator>--%>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="5" Placeholder="Content" CssClass="form-control"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Content is required!" ControlToValidate="txtContent" CssClass="error-message"></asp:RequiredFieldValidator>--%>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Upload image (optional):"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control-file" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>

    <script src="forum.js"></script>
</asp:Content>
