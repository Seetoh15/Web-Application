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

namespace WAPP_Assignment.Member
{
    public partial class forumpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string search_term = Request.QueryString["search_term"];
                // Check if search_term is in the query string
                if (!string.IsNullOrEmpty(search_term))
                {
                    dataAccess da = new dataAccess();
                    DataTable dt = da.SearchForumData(search_term);
                    PostsRepeater.DataSource = dt;
                    PostsRepeater.DataBind();
                }
                else
                {
                    dataAccess da = new dataAccess();
                    DataTable dt = da.GetForumData();
                    PostsRepeater.DataSource = dt;
                    PostsRepeater.DataBind();
                }
            }
        }

        // Method to handle null profile_pic
        protected string GetProfilePicUrl(object profilePic)
        {
            string defaultImageUrl = "../image/pp.png"; // Path to default image
            if (profilePic == DBNull.Value || string.IsNullOrEmpty(profilePic.ToString()))
            {
                return defaultImageUrl;
            }
            return profilePic.ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtTitle.Text.Trim() != "" & txtContent.Text.Trim() != "")
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter("select id from end_user where username = '" + Session["username"] + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int id = Convert.ToInt32(dt.Rows[0][0]);

                //create record in a table called end_user
                string query1 = "insert into post (title, content, image, created_at, id) values (@title, @content, @image, @created_at, @id) ";
                SqlCommand cmd1 = new SqlCommand(query1, con);

                //for file upload
                string folderPath = Server.MapPath("../PostImage/");

                //check whether Directory (Folder) exists
                if (!Directory.Exists(folderPath))
                {
                    //if Directory (Folder) does not exist, create it
                    Directory.CreateDirectory(folderPath);
                }

                string ImgPath = "";

                if (this.FileUpload1.HasFile)
                {
                    string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png" };
                    if (Array.IndexOf(allowedExtensions, fileExtension) < 0)
                    {
                        // Display an error message or handle invalid file type
                        Response.Write("<script>alert('Please upload a valid image file (jpg, jpeg, png).');</script>");
                        return;
                    }
                    else
                    {
                        ImgPath = "../PostImage/" + this.FileUpload1.FileName.ToString();
                        //saving the photo to the file directory
                        FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));
                    }
                }

                // Get the current date and time
                DateTime now = DateTime.Now;

                // Format the date and time
                string formattedDateTime = now.ToString("yyyy-MM-ddTHH:mm:ss");

                cmd1.Parameters.AddWithValue("@title", txtTitle.Text);
                cmd1.Parameters.AddWithValue("@content", txtContent.Text);
                cmd1.Parameters.AddWithValue("@image", ImgPath);
                cmd1.Parameters.AddWithValue("@created_at", formattedDateTime);
                cmd1.Parameters.AddWithValue("@id", id);
                cmd1.ExecuteNonQuery();
                Response.Redirect("forumpage.aspx");
                con.Close();
            }
            else
            {
                string script = $"alert('Title and content are required.');";
                ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
            }
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("forumpage.aspx?search_term=" + txtSearch.Text);
        }
    }
}
    
