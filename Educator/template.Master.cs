using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Educator
{
    public partial class template : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("../Guest/login.aspx");
            }
            else
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter("select profile_pic from end_user where username = '" + Session["username"] + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                string profilePicUrl = dt.Rows[0][0].ToString();

                // Check if the profile picture URL is null or empty
                if (string.IsNullOrEmpty(profilePicUrl))
                {
                    profilePicUrl = "../image/pp.png"; // Path to your default image
                }

                profile_pic.ImageUrl = profilePicUrl;

                con.Close();
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