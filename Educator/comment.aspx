<%@ Page Title="" Language="C#" MasterPageFile="~/Educator/template.Master" AutoEventWireup="true" CodeBehind="comment.aspx.cs" Inherits="WAPP_Assignment.Educator.comment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; gap:20px; padding-top:20px;">
        <div style="width:70%; height:100%; display:flex; flex-direction:column;">
            <div style="height:150px; display:flex; flex-direction:row;">
                <div style="display:flex; flex-direction:column;">
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
                    <div style="margin:20px 0 20px 50px; overflow:hidden; display:-webkit-box; -webkit-line-clamp:3; -webkit-box-orient:vertical;">
                        <asp:Literal ID="litContent" runat="server"></asp:Literal>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
