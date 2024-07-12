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
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string query = "Select count(*) from userTable where username = '" + username.Text + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (check > 0)
                {
                    ErrorMsg.Visible = true;
                    ErrorMsg.ForeColor = System.Drawing.Color.Red;
                    ErrorMsg.Text = "Username has been taken!";
                }
                else
                {
                    string query1 = "insert into userTable (fname, lanme, gender, country, email, username, password, usertype) values(@firstname, @lastname, @gender, @country, email, username, @password, @usertype) ";
                    SqlCommand cmd1 = new SqlCommand(query1, con);

                    cmd1.Parameters.AddWithValue("@fistname", fname.Text);
                    cmd1.Parameters.AddWithValue("@lastname", lname.Text);
                    cmd1.Parameters.AddWithValue("@gender", gender.SelectedItem.ToString());
                    cmd1.Parameters.AddWithValue("@country", country.Text);
                    cmd1.Parameters.AddWithValue("@email", email.Text);
                    cmd1.Parameters.AddWithValue("@password", pwd.Text);
                    cmd1.Parameters.AddWithValue("@usertype", usertype.Text);

                    cmd1.ExecuteNonQuery();
                    Response.Redirect("login.aspx");

                }
                con.Close();
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
