<%@ Page Title="" Language="C#" MasterPageFile="~/Guest/template.Master" AutoEventWireup="true" CodeBehind="guesthome.aspx.cs" Inherits="WAPP_Assignment.Guest.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="guesthome.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="homepage-container">
    <section class="hero">
        <img src="elearning.jpg" />
    <div class="hero-content">
        <h2>Welcome to LearnHub</h2>
        <p>We are providing E-Learning courses to our users. Do not wait now come and join us for free!</p>
        <asp:Button ID="joinbutton" runat="server" Text="Join us" CssClass="joinbtn" OnClick="joinbutton_Click1" />
    </div>
        <br />
        <br />
        <br />
</section>
        <section class="content">
             <h2>Why choose us?</h2>
            <div class="content-box"><link href="guesthome.css" rel="stylesheet" />
                <img src="costsaving.jpg" />
                <h3>Cost Savings</h3>
                <p>Free access for member without any hassle.</p>
            </div>
            <div class="content-box">
                <img src="calender.jpg" />
                <h3>Flexibility</h3>
                <p>Learn based on your pace and schedule, accessible anytime and everywhere.</p>
            </div>
            <div class="content-box">
                <img src="quiz.jpg" />
                <h3>Quiz attempt</h3>
                <p>Free quiz attempt for revision, improve faster than anyone else.</p>
            </div>
        </section>
         <section class="content">
             <h2>Course Offering</h2>
          <div class="content-box">
                 <img src="english.jpeg" alt="English Course" />
                 <h3>English Language</h3>
                 <p>Enhance your language skills with comprehensive English courses.</p>
          </div>
           <div class="content-box">
                 <img src="maths.png" alt="Math Course" />
                 <h3>Maths</h3>
                 <p>Master mathematical concepts and analytical skills with Math courses.</p>
           </div>
        </section>
       </div>
    <br />
    <br />
    <br />

</asp:Content>

