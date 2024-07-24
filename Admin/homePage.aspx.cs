using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace WAPP_Assignment.Admin
{
    public partial class createProfileEdu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayMemberCount();
            }

            if (!IsPostBack)
            {
                DisplayEducatorCount();
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

    }


}