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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            try
            {
                con.Open();

                // Check if user exists with matching username and password
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM end_user WHERE username = @username AND password = @password", con);
                cmd.Parameters.AddWithValue("@username", username.Text);
                cmd.Parameters.AddWithValue("@password", pwd.Text);

                int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (count > 0)
                {
                    // Retrieve user details
                    SqlCommand cmdType = new SqlCommand("SELECT name, user_type, status FROM end_user WHERE username = @username", con);
                    cmdType.Parameters.AddWithValue("@username", username.Text);

                    SqlDataReader dr = cmdType.ExecuteReader();

                    string user_type = string.Empty;
                    string name = string.Empty;
                    string status = string.Empty;

                    while (dr.Read())
                    {
                        user_type = dr["user_type"].ToString().Trim();
                        name = dr["name"].ToString().Trim();
                        status = dr["status"].ToString().Trim();
                    }

                    if (status == "Pending")
                    {
                        errorMsg.Visible = true;
                        errorMsg.ForeColor = System.Drawing.Color.Red;
                        errorMsg.Text = "Your account is pending approval.";
                        return;
                    }

                    Session["username"] = username.Text;

                    // Redirect based on user type
                    if (user_type == "Admin")
                        Response.Redirect("/Admin/homePage.aspx");
                    else if (user_type == "Member")
                        Response.Redirect("/Member/courseSelection.aspx");
                    else if (user_type == "Educator")
                        Response.Redirect("/Educator/forum.aspx");
                }
                else
                {
                    errorMsg.Visible = true;
                    errorMsg.ForeColor = System.Drawing.Color.Red;
                    errorMsg.Text = "Username and Password mismatch!";
                }
            }
            catch (Exception ex)
            {
                errorMsg.Visible = true;
                errorMsg.ForeColor = System.Drawing.Color.Red;
                errorMsg.Text = "Error during login: " + ex.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("signIn.aspx");
        }
    }
}




