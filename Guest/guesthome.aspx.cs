using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Guest
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void joinbutton_Click(object sender, EventArgs e)
        {
            Response.Redirect("signIn.aspx");
        }

        protected void joinbutton_Click1(object sender, EventArgs e)
        {
            Response.Redirect("signIn.aspx");
        }
    }
}