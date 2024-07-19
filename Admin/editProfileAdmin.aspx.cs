using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Admin
{
    public partial class editProfileAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSaveProfile_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            // Logic for the "Return to Home" link button click event
            Response.Redirect("/Admin/homePage.aspx"); // Adjust the URL as needed
        }

    }
}