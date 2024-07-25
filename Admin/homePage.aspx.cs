using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;

namespace WAPP_Assignment.Admin
{
    public partial class createProfileEdu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayMemberCount();
                DisplayEducatorCount();
                LoadAndBindPendingUsers();
            }


        }

        private void DisplayMemberCount()
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            try
            {
                con.Open();

                // Define the SQL query to count members
                string query = "SELECT COUNT(*) FROM end_user WHERE User_type = 'Member'";

                // Create a SqlCommand with the query and connection
                SqlCommand command = new SqlCommand(query, con);

                // Execute the query and get the member count
                int memberCount = (int)command.ExecuteScalar();

                // Display the count in the label
                lblmemberCount.Text = memberCount.ToString();
            }
            catch (Exception ex)
            {
                // Display any error messages
                lblmemberCount.Text = "Error: " + ex.Message;
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

        private void DisplayEducatorCount()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            try
            {
                con.Open();

                // Define the SQL query to count members
                string query = "SELECT COUNT(*) FROM end_user WHERE User_type = 'Educator'";

                // Create a SqlCommand with the query and connection
                SqlCommand command = new SqlCommand(query, con);

                // Execute the query and get the member count
                int educatorCount = (int)command.ExecuteScalar();

                // Display the count in the label
                lbleducatorCount.Text = educatorCount.ToString();
            }
            catch (Exception ex)
            {
                // Display any error messages
                lbleducatorCount.Text = "Error: " + ex.Message;
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

        [System.Web.Services.WebMethod]
        public static int[] GetUserCounts()
        {
            int[] counts = new int[3]; // 0: Educators, 1: Members, 2: Admins

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    // Queries to count each user type
                    string educatorQuery = "SELECT COUNT(*) FROM end_user WHERE User_type = 'Educator'";
                    string memberQuery = "SELECT COUNT(*) FROM end_user WHERE User_type = 'Member'";
                    string adminQuery = "SELECT COUNT(*) FROM end_user WHERE User_type = 'Admin'";

                    // Execute each query and store the counts
                    SqlCommand educatorCommand = new SqlCommand(educatorQuery, con);
                    counts[0] = (int)educatorCommand.ExecuteScalar();

                    SqlCommand memberCommand = new SqlCommand(memberQuery, con);
                    counts[1] = (int)memberCommand.ExecuteScalar();

                    SqlCommand adminCommand = new SqlCommand(adminQuery, con);
                    counts[2] = (int)adminCommand.ExecuteScalar();
                }
                catch (Exception ex)
                {
                    // Handle exception (log it, display error, etc.)
                }
            }

            return counts;
        }
        private void LoadAndBindPendingUsers()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT id, name, user_type FROM end_user WHERE Status = 'Pending'";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        PendingUsersGridView.DataSource = dt;
                        PendingUsersGridView.DataBind();
                    }
                    catch (Exception ex)
                    {
                        // Handle exception (e.g., log the error)
                        Response.Write("Error: " + ex.Message);
                    }
                }
            }
        }

        protected void PendingUsersGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "";
                    if (e.CommandName == "Approve")
                    {
                        query = "UPDATE end_user SET Status = 'Accepted' WHERE id = @id";
                    }
                    else if (e.CommandName == "Reject")
                    {
                        query = "DELETE FROM end_user WHERE id = @id";
                    }

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.ExecuteNonQuery();
                    }
                }

                // Reload the page to refresh the data
                Response.Redirect(Request.RawUrl);
            }
        }




    }


}