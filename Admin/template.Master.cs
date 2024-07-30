using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Admin
{
    public partial class template : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Assuming you have the username stored in a session variable
                string username = Session["username"] as string;

                if (!string.IsNullOrEmpty(username))
                {
                    lblWelcomeMessage.Text = $"Welcome, {username}";
                }
                else
                {
                    lblWelcomeMessage.Text = "Welcome, Admin";
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Request.Cookies.Clear();

            Response.Redirect("../Guest/login.aspx");
        }
    }
}