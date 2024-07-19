<%@ Page Title="" Language="C#" MasterPageFile="~/Guest/template.Master" AutoEventWireup="true" CodeBehind="contactUs.aspx.cs" Inherits="WAPP_Assignment.Guest.contactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="contactUs.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style2 {
            width: 108px;
            margin-right: 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="team-section">
    <div class="container">
        <h2>Our Team</h2>
        <div class="team-members">

            <div class="team-member">
                <img src="jet.jpg" alt="Managing Director Photo">
                <h3>Jet Lai Kai Jian</h3>
                <p>Managing Director</p>
                <p>Email: tp066144@mail.apu.edu.my</p>
                <p>Phone: +60 12 385 8100</p>
            </div>

            <div class="team-member">
                <img src="yip.png" alt="Director Photo" class="auto-style2" />
                <h3>Yip Zheng Qing</h3>
                <p>Director</p>
                <p>Email: tp065234@mail.apu.edu.my</p>
                <p>Phone: +60 18 212 8483</p>
            </div>

            <div class="team-member">
                <img src="joshua.jpg" alt="Project Manager Photo">
                <h3>Joshua Wong Jin Kai</h3>
                <p>Project Manager</p>
                <p>Email: tp063094@mail.apu.edu.my</p>
                <p>Phone: +60 10 438 3050</p>
            </div>

            <div class="team-member">
                <img src="seetoh.PNG" alt="Admin Photo">
                <h3>See Toh Man Cheng</h3>
                <p>Admin</p>
                <p>Email: tp065183@mail.apu.edu.my</p>
                <p>Phone: +60 19 770 3117</p>
            </div>

        </div>
    </div>
</section>
 <div class="contact-info">
  <h3>Company Information</h3>
  <p>Address: Jalan Teknologi 5, Taman Teknologi Malaysia, 57000 Kuala Lumpur,
      Wilayah Persekutuan Kuala Lumpur.</p>
  <p>Email: admin@apu.edu.my</p>
  <p>Phone: +603 8996 1000</p>

  <h3>Location</h3>
  <div class="map-container">
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7968.316982395196!2d101.69256475773636!3d3.052207701305323!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc4abb795025d9%3A0x1c37182a714ba968!2sAsia%20Pacific%20University%20of%20Technology%20%26%20Innovation%20(APU)!5e0!3m2!1sen!2smy!4v1721399868413!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
  </div>
</div>

</asp:Content>
