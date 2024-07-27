using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Admin
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAdminDetails();
                LoadAndBindUsers();
            }

        }


        private void LoadAdminDetails()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT id, profile_pic, username, name, gender, email, country FROM end_user WHERE User_type = 'Admin' AND status = 'Accepted'";
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
            int id = Convert.ToInt32(e.CommandArgument);
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            if (e.CommandName == "Delete")
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "DELETE FROM end_user WHERE id = @id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.ExecuteNonQuery();
                    }
                }

                // Reload the page to refresh the data
                Response.Redirect(Request.RawUrl);
            }
            else if (e.CommandName == "Edit")
            {
                // Redirect to edit page with user ID as query parameter
                Response.Redirect("editProfileAdmin.aspx?id=" + id);
            }
        }

        private void LoadAndBindUsers(string searchQuery = "")
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                // Initial query with the existing WHERE clause
                string query = "SELECT id, profile_pic, username, name, gender, email, country FROM end_user WHERE User_type = 'Admin' AND status = 'Accepted'";

                // Use AND instead of WHERE to add search conditions
                if (!string.IsNullOrEmpty(searchQuery))
                {
                    query += " AND (Name LIKE @search OR Username LIKE @search OR Email LIKE @search OR Gender LIKE @search OR Country LIKE @search)";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrEmpty(searchQuery))
                    {
                        cmd.Parameters.AddWithValue("@search", "%" + searchQuery + "%");
                    }

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

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string searchQuery = SearchTextBox.Text.Trim();
            LoadAndBindUsers(searchQuery);
        }


    }
}