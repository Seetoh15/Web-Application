<%@ Page Title="" Language="C#" MasterPageFile="~/Member/template.Master" AutoEventWireup="true" CodeBehind="postForum.aspx.cs" Inherits="WAPP_Assignment.Member.postForum1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="postForum.css" />
    <script>
        function confirmPostDeletion() {
            return confirm("Are you sure you want to delete this post?");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; gap:20px; padding-top:20px;">
        <div style="width:70%; height:100%; display:flex; flex-direction:column;">
            <div style="height:150px; display:flex; flex-direction:row;">
                <div style="display:flex; flex-direction:column; width:100%;">
                    <div style="text-align:right; margin-bottom:10px;">
                        <% if (IsPostAuthor) { %>
                            <asp:Button ID="btnRemove" CssClass="btnRemove" runat="server" Text="Remove Post" OnClick="btnRemove_Click" OnClientClick="return confirmPostDeletion();" />
                        <% } %>
                    </div>
                    <div style="box-shadow:0 4px 8px rgba(0, 0, 0, 0.1); padding:10px; background:white; border-radius:10px;">
                        <div style="display:flex; flex-direction:row; margin-top:10px; width:100%;">
                            <asp:Image ID="imgProfilePic" CssClass="profile-pic" runat="server" AlternateText="Profile Picture" />
                            <div style="display:flex; flex-direction:column; margin-left:10px; width:100%;">
                                <div style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
                                    <b>
                                        <asp:Literal ID="litTitle" runat="server"></asp:Literal>
                                    </b>
                                </div>
                                <span style="color:lightslategrey; font-size:13px;">By <asp:Literal ID="litUsername" runat="server"></asp:Literal> <asp:Literal ID="litCreatedAt" runat="server"></asp:Literal></span>
                            </div>
                        </div>
                        <div style="margin:20px 0 20px 50px;">
                            <asp:Literal ID="litContent" runat="server"></asp:Literal>
                        </div>
                        <div>
                            <asp:Image ID="postImage" runat="server" AlternateText="Post Image" Visible="false" style="width:100%;" />
                        </div>
                    </div>
                    <h3>Comments</h3>
                    <div style="display:flex; flex-direction:row; width:100%; align-items:center;">
                        <asp:TextBox ID="txtComment" runat="server" Rows="3" TextMode="MultiLine" style="width:80%;"></asp:TextBox>
                        <div style="width:20%; text-align:center;">
                            <asp:Button ID="Button1" runat="server" Text="Comment" CssClass="button" OnClick="Button1_Click" />
                        </div>
                    </div>
                    <div style="display:flex; flex-direction:column; gap:10px;">
                        <asp:Repeater ID="CommentRepeater" runat="server">
                            <ItemTemplate>
                                <div style="display:flex; flex-direction:row;">
                                    <div style="display:flex; flex-direction:column; width:100%;">
                                        <div style="display:flex; flex-direction:row; margin-top:10px; width:100%;">
                                            <img src="<%# GetProfilePicUrl(Eval("profile_pic")) %>" alt="Profile picture" class="profile-pic" />
                                            <div style="display:flex; flex-direction:column; margin-left:10px; width:100%;">
                                                <span style="color:lightslategrey; font-size:13px;">@<%# Eval("username") %> <%# Eval("created_at") %></span>
                                                <div>
                                                    <%# Eval("content") %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <div>
                
            </div>
        </div>
    </div>
</asp:Content>
