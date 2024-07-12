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
    public partial class signIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSignup_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    con.Open();


                    string query = "SELECT COUNT(*) FROM end_user WHERE username = @username";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@username", username.Text);
                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    if (count > 0)
                    {
                        ErrorMsg.Visible = true;
                        ErrorMsg.ForeColor = System.Drawing.Color.Red;
                        ErrorMsg.Text = "Username has been taken!";
                    }
                    else
                    {

                        string query1 = "INSERT INTO end_user (name, gender, country, email, username, password, user_type) " +
                                        "VALUES (@name, @gender, @country, @email, @username, @password, @user_type)";

                        SqlCommand cmd1 = new SqlCommand(query1, con);
                        cmd1.Parameters.AddWithValue("@name", name.Text);
                        cmd1.Parameters.AddWithValue("@gender", gender.SelectedValue);
                        cmd1.Parameters.AddWithValue("@country", country.Text);
                        cmd1.Parameters.AddWithValue("@email", email.Text);
                        cmd1.Parameters.AddWithValue("@username", username.Text);
                        cmd1.Parameters.AddWithValue("@password", password.Text);
                        cmd1.Parameters.AddWithValue("@user_type", user_type.SelectedValue);

                        cmd1.ExecuteNonQuery();
                        Response.Redirect("login.aspx");
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                ErrorMsg.Visible = true;
                ErrorMsg.ForeColor = System.Drawing.Color.Red;
                ErrorMsg.Text = "Registration not succesful!" + ex.ToString();
            }

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}
