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
                DisplayAllCount();
                LoadAndBindPendingUsers();
            }


        }

        private void DisplayAllCount()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            try
            {
                con.Open();

                // Define the SQL queries to count members and admins
                string queryM = "SELECT COUNT(*) FROM end_user WHERE User_type = 'Member' AND status = 'Accepted'";
                string queryA = "SELECT COUNT(*) FROM end_user WHERE User_type = 'Admin' AND status = 'Accepted'";
                string queryE = "SELECT COUNT(*) FROM end_user WHERE User_type = 'Educator' AND status = 'Accepted'";

                // Create a SqlCommand for the member count query
                SqlCommand commandM = new SqlCommand(queryM, con);
                int memberCount = (int)commandM.ExecuteScalar();
                lblmemberCount.Text = memberCount.ToString();

                // Create a SqlCommand for the admin count query
                SqlCommand commandA = new SqlCommand(queryA, con);
                int adminCount = (int)commandA.ExecuteScalar();
                lbladminCount.Text = adminCount.ToString();

                // Create a SqlCommand for the educator count query
                SqlCommand commandE = new SqlCommand(queryE, con);
                int educatorCount = (int)commandE.ExecuteScalar();
                lbleducatorCount.Text = educatorCount.ToString();

            }
            catch (Exception ex)
            {
                // Display any error messages
                lblmemberCount.Text = "Error: " + ex.Message;
                lbladminCount.Text = "Error: " + ex.Message;
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


        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("generateReportAdmin.aspx");
        }

    }
}