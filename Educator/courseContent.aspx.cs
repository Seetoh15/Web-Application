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
    public partial class courseContent : System.Web.UI.Page
    {
        protected string course_subject { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["course_id"] != null)
                {
                    int course_id;
                    if (int.TryParse(Request.QueryString["course_id"], out course_id))
                    {
                        LoadChapter(course_id);
                        LoadQuiz(course_id);
                        course_subject = GetCourseSubject(course_id);
                    }
                }
            }
        }

        private void LoadChapter(int course_id)
        {
            dataAccess da = new dataAccess();
            DataTable dt = da.GetChapter(course_id);
            ChapterRepeater.DataSource = dt;
            ChapterRepeater.DataBind();
        }

        private void LoadQuiz(int course_id)
        {
            dataAccess da = new dataAccess();
            DataTable dt = da.GetQuiz(course_id);
            QuizRepeater.DataSource = dt;
            QuizRepeater.DataBind();
        }

        private string GetCourseSubject(int course_id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("SELECT subject FROM course WHERE course_id = '" + course_id + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt.Rows[0][0].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int course_id;
            int.TryParse(Request.QueryString["course_id"], out course_id);
            Response.Redirect("addLearningMaterial.aspx?course_id=" + course_id);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int course_id;
            int.TryParse(Request.QueryString["course_id"], out course_id);
            Response.Redirect("addQuiz.aspx?course_id=" + course_id);
        }
    }
}