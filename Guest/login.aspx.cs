using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Guest
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                SqlCommand cmd = new SqlCommand("Select count(*) from end_user where username = '" +
                    username.Text + "' and Password = '" + pwd.Text + " ' ", con);
                int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (count > 0)
                {
                    SqlCommand cmdType = new SqlCommand("select name, user_type from end_user where username = '" + username.Text + " ' ", con);

                    SqlDataReader dr = cmdType.ExecuteReader();

                    String user_type = " ";
                    String name = " ";

                    while (dr.Read())
                    {
                        user_type = dr["user_type"].ToString().Trim();
                        name = dr["name"].ToString().Trim();
                    }
                    Session["username"] = username.Text;

                    if (user_type == "Admin")
                        Response.Redirect("/Admin/homePage.aspx");
                    else if (user_type == "Member")
                        Response.Redirect("courseSelection.aspx");
                    else if (user_type == "Educator")
                        Response.Redirect("educator.aspx");

                }
                else
                {
                    errorMsg.Visible = true;
                    errorMsg.ForeColor = System.Drawing.Color.Red;
                    errorMsg.Text = "Username and Password mismatch!";
                    return;
                }
                con.Close();
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("signIn.aspx");
        }
    }

}
