using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
    }


}