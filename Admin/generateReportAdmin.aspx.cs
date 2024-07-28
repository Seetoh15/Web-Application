using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Admin
{
    public partial class generateReportAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayAllCount();

                // Retrieve the admin's username from the session and display it
                if (Session["username"] != null)
                {
                    lblAdminUsername.Text = Session["username"].ToString();
                }
                else
                {
                    lblAdminUsername.Text = "Unknown Admin";
                }

                // Set the current date to the lblDateCreated label
                lblDateCreated.Text = DateTime.Now.ToString("MMMM dd, yyyy");
            }
        }

        private void DisplayUsername(string id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();
                    string query = "SELECT username FROM end_user WHERE id = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", id);

                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        lblAdminUsername.Text = result.ToString();
                    }
                    else
                    {
                        lblAdminUsername.Text = "User not found";
                    }
                }
                catch (Exception ex)
                {
                    lblAdminUsername.Text = "Error loading username";
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
        }

        private void DisplayAllCount()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            try
            {
                con.Open();

                // Define the SQL queries to count members, admins, and educators
                string queryM = "SELECT COUNT(*) FROM end_user WHERE User_type = 'Member' AND status = 'Accepted'";
                string queryA = "SELECT COUNT(*) FROM end_user WHERE User_type = 'Admin' AND status = 'Accepted'";
                string queryE = "SELECT COUNT(*) FROM end_user WHERE User_type = 'Educator' AND status = 'Accepted'";

                // Create a SqlCommand for the member count query
                SqlCommand commandM = new SqlCommand(queryM, con);
                int memberCount = (int)commandM.ExecuteScalar();
                Label1.Text = "Total number of Member : " + memberCount.ToString();

                // Create a SqlCommand for the admin count query
                SqlCommand commandA = new SqlCommand(queryA, con);
                int adminCount = (int)commandA.ExecuteScalar();
                Label2.Text = "Total number of Admin : " + adminCount.ToString();

                // Create a SqlCommand for the educator count query
                SqlCommand commandE = new SqlCommand(queryE, con);
                int educatorCount = (int)commandE.ExecuteScalar();
                Label3.Text = "Total number of Educator : "  + educatorCount.ToString();


            }
            catch (Exception ex)
            {
                // Display any error messages
                Label1.Text = "Error: " + ex.Message;
                Label2.Text = "Error: " + ex.Message;
                Label3.Text = "Error: " + ex.Message;
            }
            finally
            {
                // Ensure the connection is closed
                if (con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }

    }

}

            
        
    

   

