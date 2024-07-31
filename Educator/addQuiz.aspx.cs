using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Educator
{
    public partial class addQuiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtTitle.Text.Trim() != "")
            {
                int course_id;
                int.TryParse(Request.QueryString["course_id"], out course_id);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                //create record in a table called end_user
                string query1 = "insert into quiz (title, created_at, course_id) values (@title, @created_at, @course_id) ";
                SqlCommand cmd1 = new SqlCommand(query1, con);

                // Get the current date and time
                DateTime now = DateTime.Now;

                // Format the date and time
                string formattedDateTime = now.ToString("yyyy-MM-ddTHH:mm:ss");

                cmd1.Parameters.AddWithValue("@title", txtTitle.Text);
                cmd1.Parameters.AddWithValue("@created_at", formattedDateTime);
                cmd1.Parameters.AddWithValue("@course_id", course_id);
                cmd1.ExecuteNonQuery();
                Response.Redirect("courseContent.aspx?course_id=" + course_id);
                con.Close();
            }
            else
            {
                string script = $"alert('Quiz title is required!');";
                ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
            }
        }
    }
}