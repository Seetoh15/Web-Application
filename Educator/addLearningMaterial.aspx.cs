using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Educator
{
    public partial class addLearningMaterial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtTopic.Text.Trim() != "" & this.FileUpload1.HasFile)
            {
                int course_id;
                int.TryParse(Request.QueryString["course_id"], out course_id);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                //create record in a table called end_user
                string query1 = "INSERT INTO chapter (topic, [file], course_id) VALUES (@topic, @file, @course_id)";
                SqlCommand cmd1 = new SqlCommand(query1, con);

                //for file upload
                string folderPath = Server.MapPath("../ChapterFile/");

                //check whether Directory (Folder) exists
                if (!Directory.Exists(folderPath))
                {
                    //if Directory (Folder) does not exist, create it
                    Directory.CreateDirectory(folderPath);
                }

                string FilePath = "";

                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                string[] allowedExtensions = { ".pdf" };
                if (Array.IndexOf(allowedExtensions, fileExtension) < 0)
                {
                    // Display an error message or handle invalid file type
                    Response.Write("<script>alert('Please upload a PDF file.');</script>");
                    return;
                }
                else
                {
                    FilePath = "../ChapterFile/" + this.FileUpload1.FileName.ToString();
                    //saving the photo to the file directory
                    FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));
                }

                //// Get the current date and time
                //DateTime now = DateTime.Now;

                //// Format the date and time
                //string formattedDateTime = now.ToString("yyyy-MM-ddTHH:mm:ss");

                cmd1.Parameters.AddWithValue("@topic", txtTopic.Text);
                cmd1.Parameters.AddWithValue("@file", FilePath);
                cmd1.Parameters.AddWithValue("@course_id", course_id);
                cmd1.ExecuteNonQuery();
                Response.Redirect("courseContent.aspx?course_id=" + course_id);
                con.Close();
            }
            else
            {
                string script = $"alert('Topic and PDF are required!');";
                ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
            }
        }
    }
}