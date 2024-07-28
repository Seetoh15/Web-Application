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
    public partial class editProfileAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/guest/login.aspx");
            }

            

                if (!Page.IsPostBack)
                {
                    // Retrieve user ID from query string
                    string userId = Request.QueryString["id"];

                    if (!string.IsNullOrEmpty(userId))
                    {
                        LoadUserDetails(userId);
                    }
                    else
                    {
                        // Handle the case where no user ID is provided
                        Response.Write("Invalid user ID.");
                    }
                }
        }

        private void LoadUserDetails(string userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT username, name, email, country, gender, user_type, password, profile_pic FROM end_user WHERE id = @id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", userId);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    username.Text = reader["username"].ToString();
                    name.Text = reader["name"].ToString();
                    email.Text = reader["email"].ToString();
                    country.Text = reader["country"].ToString();
                    gender.SelectedValue = reader["gender"].ToString();
                    user_type.SelectedValue = reader["user_type"].ToString();
                    password.Text = reader["password"].ToString();
                    profile_pic.ImageUrl = reader["profile_pic"].ToString();
                    img.Text = reader["profile_pic"].ToString();
                }
                else
                {
                    // Handle the case where no data is found
                    Response.Write("No user found.");
                }

                reader.Close();
            }
        }

        protected void ButtonSaveProfile_Click(object sender, EventArgs e)
        {
            // Existing save logic
            string folderPath = Server.MapPath("../ProfilePic/");

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            string ImgPath = "";

            if (this.FileUpload1.HasFile)
            {
                ImgPath = "../ProfilePic/" + this.FileUpload1.FileName.ToString();
                FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));
            }
            else
            {
                ImgPath = img.Text;
            }

            string userId = Request.QueryString["id"];
            if (!string.IsNullOrEmpty(userId))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "UPDATE end_user SET password = @password, name = @name, gender = @gender, email = @email, profile_pic = @profile_pic, country = @country WHERE id = @id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@password", password.Text);
                    cmd.Parameters.AddWithValue("@name", name.Text);
                    cmd.Parameters.AddWithValue("@gender", gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@email", email.Text);
                    cmd.Parameters.AddWithValue("@profile_pic", ImgPath);
                    cmd.Parameters.AddWithValue("@country", country.Text);
                    cmd.Parameters.AddWithValue("@id", userId);

                    cmd.ExecuteNonQuery();

                }

            }
            if (Session["PreviousPage"] != null)
            {
                Response.Redirect("editProfileAdmin.aspx?id=" + userId); // Refresh the page to reflect changes
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect(Session["PreviousPage"].ToString());
        }
    }
}