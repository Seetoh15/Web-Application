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
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string title = QuizTitle.Text.Trim();
            string description = QuizDescription.Text.Trim();
            var questionTexts = Request.Form.GetValues("questionText");
            var choiceTexts = Request.Form.GetValues("choiceText");
            var isCorrectValues = Request.Form.GetValues("isCorrect");

            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(description) || questionTexts == null || questionTexts.Length == 0)
            {
                string script = $"alert('Title and content are required.');";
                ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Insert the quiz
                string insertQuizQuery = "INSERT INTO Quiz (Title, Description, CreatedAt) VALUES (@Title, @Description, @CreatedAt); SELECT SCOPE_IDENTITY();";
                SqlCommand cmdQuiz = new SqlCommand(insertQuizQuery, con);
                cmdQuiz.Parameters.AddWithValue("@Title", title);
                cmdQuiz.Parameters.AddWithValue("@Description", description);
                cmdQuiz.Parameters.AddWithValue("@CreatedAt", DateTime.Now);
                int quizId = Convert.ToInt32(cmdQuiz.ExecuteScalar());

                // Insert the questions and choices
                string insertQuestionQuery = "INSERT INTO Question (QuestionText, QuizId) VALUES (@QuestionText, @QuizId); SELECT SCOPE_IDENTITY();";
                string insertChoiceQuery = "INSERT INTO Choice (ChoiceText, IsCorrect, QuestionId) VALUES (@ChoiceText, @IsCorrect, @QuestionId)";
                int choiceIndex = 0;

                for (int i = 0; i < questionTexts.Length; i++)
                {
                    SqlCommand cmdQuestion = new SqlCommand(insertQuestionQuery, con);
                    cmdQuestion.Parameters.AddWithValue("@QuestionText", questionTexts[i]);
                    cmdQuestion.Parameters.AddWithValue("@QuizId", quizId);
                    int questionId = Convert.ToInt32(cmdQuestion.ExecuteScalar());

                    for (int j = 0; j < 4; j++)
                    {
                        SqlCommand cmdChoice = new SqlCommand(insertChoiceQuery, con);
                        cmdChoice.Parameters.AddWithValue("@ChoiceText", choiceTexts[choiceIndex]);
                        cmdChoice.Parameters.AddWithValue("@IsCorrect", isCorrectValues[choiceIndex].EndsWith(j.ToString()) ? 1 : 0);
                        cmdChoice.Parameters.AddWithValue("@QuestionId", questionId);
                        cmdChoice.ExecuteNonQuery();
                        choiceIndex++;
                    }
                }
            }

            Response.Redirect("QuizList.aspx");
        }
    }
}