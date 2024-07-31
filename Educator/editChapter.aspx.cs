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

namespace WAPP_Assignment.Educator
{
    public partial class editChapter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if post_id is provided in the query string
                if (Request.QueryString["chapter_id"] != null)
                {
                    int chapter_id;
                    // Parse the post_id from the query string
                    if (int.TryParse(Request.QueryString["chapter_id"], out chapter_id))
                    {
                        LoadChapterDetails(chapter_id);
                    }
                }
            }
        }

        private void LoadChapterDetails(int chapter_id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM chapter WHERE chapter_id = '" + chapter_id + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            txtTopic.Text = dt.Rows[0][1].ToString();
            lblFile.Text = dt.Rows[0][3].ToString();
            con.Close();
        }

        protected void DeleteChapter(object sender, EventArgs e)
        {
            int chapter_id, course_id = 0;
            if (int.TryParse(Request.QueryString["chapter_id"], out chapter_id))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Begin a transaction to ensure both delete operations succeed or fail together
                    SqlTransaction transaction = con.BeginTransaction();

                    string selectQuery = "SELECT course_id FROM chapter WHERE chapter_id = @chapter_id";
                    SqlCommand selectCmd = new SqlCommand(selectQuery, con, transaction);
                    selectCmd.Parameters.AddWithValue("@chapter_id", chapter_id);

                    object result = selectCmd.ExecuteScalar();
                    course_id = Convert.ToInt32(result);

                    try
                    {
                        string deleteCommentsQuery = "DELETE FROM chapter WHERE chapter_id = @chapter_id";
                        SqlCommand deleteCommentsCmd = new SqlCommand(deleteCommentsQuery, con, transaction);
                        deleteCommentsCmd.Parameters.AddWithValue("@chapter_id", chapter_id);
                        deleteCommentsCmd.ExecuteNonQuery();

                        // Commit the transaction
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        // Rollback the transaction if an error occurs
                        transaction.Rollback();
                        // Optionally, log the exception or display an error message
                        string script = $"alert('Error deleting chapter: {ex.Message}');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
                    }
                }
            }

            // Redirect back to the same page or another page after deletion
            Response.Redirect("courseContent.aspx?course_id=" + course_id);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtTopic.Text.Trim() != "" & lblFile.Text.Trim() != "")
            {
                //int question_id = int.Parse(Request.QueryString["question_id"]);
                int chapter_id = 0;

                // Check if the question_id is available in the query string to determine if editing
                if (int.TryParse(Request.QueryString["chapter_id"], out chapter_id))
                {
                    //for file upload
                    string folderPath = Server.MapPath("../ChapterFile/");

                    //check whether Directory (Folder) exists
                    if (!Directory.Exists(folderPath))
                    {
                        //if Directory (Folder) does not exist, create it
                        Directory.CreateDirectory(folderPath);
                    }

                    string FilePath = "";

                    if (this.FileUpload1.HasFile)
                    {
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
                    }
                    else
                    {
                        FilePath = lblFile.Text;
                    }
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();

                    // Update the existing question
                    string queryUpdateQuestion = "UPDATE chapter SET topic = @topic, [file] = @file WHERE chapter_id = '" + chapter_id + "'";
                    SqlCommand cmdUpdateQuestion = new SqlCommand(queryUpdateQuestion, con);
                    cmdUpdateQuestion.Parameters.AddWithValue("@topic", txtTopic.Text);
                    cmdUpdateQuestion.Parameters.AddWithValue("@file", FilePath);
                    cmdUpdateQuestion.ExecuteNonQuery();

                    con.Close();

                    Response.Redirect("editChapter.aspx?chapter_id=" + chapter_id);
                }
                else
                {
                    string script = "alert('Invalid chapter ID.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
                }
            }
            else
            {
                string script = "alert('Please fill up the chapter title and upload a PDF file.');";
                ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
            }
        }
    }
}