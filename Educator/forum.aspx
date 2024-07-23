<%@ Page Title="" Language="C#" MasterPageFile="~/Educator/template.Master" AutoEventWireup="true" CodeBehind="forum.aspx.cs" Inherits="WAPP_Assignment.Educator.forum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="forum.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%; height:100%; display:flex; flex-direction:column; align-items:center; gap:20px; padding-top:20px;">
        <div class="search">
            <span class="search-icon material-symbols-outlined">search</span>
            <%--<input class="search-input" type="search" placeholder="Search" />--%>
            <%--<input id="search-input" class="search-input" type="text" placeholder="Search" />--%>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="search-input" placeholder="Search"></asp:TextBox>
        </div>
        <div style="width:70%; height:100%; display:flex; flex-direction:column;">
            <a href="#">
                <div style="height:150px; display:flex; flex-direction:row;">
                    <div style="display:flex; flex-direction:column; width:75%;">
                        <div style="display:flex; flex-direction:row; margin-top:10px; width:100%;">
                            <img src="../image/pp.png" alt="" />
                            <div style="display:flex; flex-direction:column; margin-left:10px; width:100%;">
                                <div style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
                                    <b>How to Hire a SaaS Software Developer at a Low Cost?</b>
                                </div>
                                <span style="color:lightslategrey; font-size:13px;">By Yip Zheng Qing</span>
                            </div>
                        </div>
                        <div style="margin:20px 0 20px 50px; overflow:hidden; display:-webkit-box; -webkit-line-clamp:3; -webkit-box-orient:vertical;">
                            Remote Work: Look for developers in regions with lower living costs or countries with favorable exchange rates. Remote work allows access to a global talent pool, potentially reducing costs.
                        </div>
                    </div>
                    <div style="width:auto; display:flex; flex-direction:row; width: 25%; justify-content:right; align-items:center; gap:5px; font-size:23px;">
                        <div>
                            100
                        </div>
                        <div>
                            <i class="fa fa-comments"></i>
                        </div>
                    </div>
                </div>
            </a>
            <hr />
            <a href="#">
                <div style="height:150px; display:flex; flex-direction:row;">
                    <div style="display:flex; flex-direction:column; width:75%;">
                        <div style="display:flex; flex-direction:row; margin-top:10px; width:100%;">
                            <img src="../image/pp.png" alt="" />
                            <div style="display:flex; flex-direction:column; margin-left:10px; width:100%;">
                                <div style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">
                                    <b>How to Hire a SaaS Software Developer at a Low Cost?</b>
                                </div>
                                <span style="color:lightslategrey; font-size:13px;">By Yip Zheng Qing</span>
                            </div>
                        </div>
                        <div style="margin:20px 0 20px 50px; overflow:hidden; display:-webkit-box; -webkit-line-clamp:3; -webkit-box-orient:vertical;">
                            Remote Work: Look for developers in regions with lower living costs or countries with favorable exchange rates. Remote work allows access to a global talent pool, potentially reducing costs.
                            To style elements effectively in your HTML, you can use CSS to control their appearance. Here’s how you can apply styles to tags in your existing structure:
                        </div>
                    </div>
                    <div style="width:auto; display:flex; flex-direction:row; width: 25%; justify-content:right; align-items:center; gap:5px; font-size:23px;">
                        <div>
                            100
                        </div>
                        <div>
                            <i class="fa fa-comments"></i>
                        </div>
                    </div>
                </div>
            </a>
            <hr />
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </div>
</asp:Content>
