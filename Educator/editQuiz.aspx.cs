using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Educator
{
    public partial class editQuiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadQuizDetails();
            }
        }

        private void LoadQuizDetails()
        {
            //int quizId = int.Parse(Request.QueryString["quizId"]);
            int quiz_id = 1;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Load quiz details
                string queryQuiz = "SELECT * FROM quiz WHERE quiz_id = @quiz_id";
                SqlCommand cmdQuiz = new SqlCommand(queryQuiz, con);
                cmdQuiz.Parameters.AddWithValue("@quiz_id", quiz_id);
                SqlDataReader readerQuiz = cmdQuiz.ExecuteReader();
                if (readerQuiz.Read())
                {
                    QuizTitle.Text = readerQuiz["Title"].ToString();
                    QuizDescription.Text = readerQuiz["Description"].ToString();
                }
                readerQuiz.Close();

                // Load questions and choices
                string queryQuestions = "SELECT * FROM question WHERE quiz_id = @quiz_id";
                SqlDataAdapter daQuestions = new SqlDataAdapter(queryQuestions, con);
                daQuestions.SelectCommand.Parameters.AddWithValue("@quiz_id", quiz_id);
                DataTable dtQuestions = new DataTable();
                daQuestions.Fill(dtQuestions);

                QuestionsRepeater.DataSource = dtQuestions;
                QuestionsRepeater.DataBind();
            }
        }

        protected void QuestionsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int question_id = (int)DataBinder.Eval(e.Item.DataItem, "question_id");
                Repeater choicesRepeater = (Repeater)e.Item.FindControl("ChoicesRepeater");

                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string queryChoices = "SELECT * FROM choice WHERE question_id = @question_id";
                    SqlDataAdapter daChoices = new SqlDataAdapter(queryChoices, con);
                    daChoices.SelectCommand.Parameters.AddWithValue("@question_id", question_id);
                    DataTable dtChoices = new DataTable();
                    daChoices.Fill(dtChoices);

                    choicesRepeater.DataSource = dtChoices;
                    choicesRepeater.DataBind();
                }
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            int quizId = int.Parse(Request.QueryString["quizId"]);
            string title = QuizTitle.Text.Trim();
            string description = QuizDescription.Text.Trim();
            var questionTexts = Request.Form.GetValues("questionText");
            var choiceTexts = Request.Form.GetValues("choiceText");
            var isCorrectValues = Request.Form.GetValues("isCorrect");
            var deletedQuestions = Request.Form.GetValues("deletedQuestions");
            var deletedChoices = Request.Form.GetValues("deletedChoices");

            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(description) || questionTexts == null || questionTexts.Length == 0)
            {
                ShowErrorMessage("Title, Description, and at least one Question are required.");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Update quiz
                string updateQuizQuery = "UPDATE Quiz SET Title = @Title, Description = @Description WHERE QuizId = @QuizId";
                SqlCommand cmdQuiz = new SqlCommand(updateQuizQuery, con);
                cmdQuiz.Parameters.AddWithValue("@Title", title);
                cmdQuiz.Parameters.AddWithValue("@Description", description);
                cmdQuiz.Parameters.AddWithValue("@QuizId", quizId);
                cmdQuiz.ExecuteNonQuery();

                // Delete questions
                if (deletedQuestions != null)
                {
                    foreach (string questionId in deletedQuestions)
                    {
                        string deleteQuestionQuery = "DELETE FROM Question WHERE QuestionId = @QuestionId";
                        SqlCommand cmdDeleteQuestion = new SqlCommand(deleteQuestionQuery, con);
                        cmdDeleteQuestion.Parameters.AddWithValue("@QuestionId", questionId);
                        cmdDeleteQuestion.ExecuteNonQuery();

                        string deleteChoicesQuery = "DELETE FROM Choice WHERE QuestionId = @QuestionId";
                        SqlCommand cmdDeleteChoices = new SqlCommand(deleteChoicesQuery, con);
                        cmdDeleteChoices.Parameters.AddWithValue("@QuestionId", questionId);
                        cmdDeleteChoices.ExecuteNonQuery();
                    }
                }

                // Delete choices
                if (deletedChoices != null)
                {
                    foreach (string choiceId in deletedChoices)
                    {
                        string deleteChoiceQuery = "DELETE FROM Choice WHERE ChoiceId = @ChoiceId";
                        SqlCommand cmdDeleteChoice = new SqlCommand(deleteChoiceQuery, con);
                        cmdDeleteChoice.Parameters.AddWithValue("@ChoiceId", choiceId);
                        cmdDeleteChoice.ExecuteNonQuery();
                    }
                }

                // Update questions and choices
                foreach (RepeaterItem item in QuestionsRepeater.Items)
                {
                    int questionId = int.Parse(((HiddenField)item.FindControl("QuestionId")).Value);
                    string questionText = ((TextBox)item.FindControl("questionText")).Text.Trim();

                    string updateQuestionQuery = "UPDATE Question SET QuestionText = @QuestionText WHERE QuestionId = @QuestionId";
                    SqlCommand cmdQuestion = new SqlCommand(updateQuestionQuery, con);
                    cmdQuestion.Parameters.AddWithValue("@QuestionText", questionText);
                    cmdQuestion.Parameters.AddWithValue("@QuestionId", questionId);
                    cmdQuestion.ExecuteNonQuery();

                    Repeater choicesRepeater = (Repeater)item.FindControl("ChoicesRepeater");
                    foreach (RepeaterItem choiceItem in choicesRepeater.Items)
                    {
                        int choiceId = int.Parse(((HiddenField)choiceItem.FindControl("ChoiceId")).Value);
                        string choiceText = ((TextBox)choiceItem.FindControl("choiceText")).Text.Trim();
                        bool isCorrect = ((RadioButton)choiceItem.FindControl("isCorrect")).Checked;

                        string updateChoiceQuery = "UPDATE Choice SET ChoiceText = @ChoiceText, IsCorrect = @IsCorrect WHERE ChoiceId = @ChoiceId";
                        SqlCommand cmdChoice = new SqlCommand(updateChoiceQuery, con);
                        cmdChoice.Parameters.AddWithValue("@ChoiceText", choiceText);
                        cmdChoice.Parameters.AddWithValue("@IsCorrect", isCorrect);
                        cmdChoice.Parameters.AddWithValue("@ChoiceId", choiceId);
                        cmdChoice.ExecuteNonQuery();
                    }
                }

                // Insert new questions and choices
                var newQuestionTexts = Request.Form.GetValues("newQuestionText");
                var newChoiceTexts = Request.Form.GetValues("newChoiceText");
                var newIsCorrectValues = Request.Form.GetValues("newIsCorrect");
                if (newQuestionTexts != null)
                {
                    for (int i = 0; i < newQuestionTexts.Length; i++)
                    {
                        string insertQuestionQuery = "INSERT INTO Question (QuestionText, QuizId) VALUES (@QuestionText, @QuizId); SELECT SCOPE_IDENTITY();";
                        SqlCommand cmdNewQuestion = new SqlCommand(insertQuestionQuery, con);
                        cmdNewQuestion.Parameters.AddWithValue("@QuestionText", newQuestionTexts[i]);
                        cmdNewQuestion.Parameters.AddWithValue("@QuizId", quizId);
                        int newQuestionId = Convert.ToInt32(cmdNewQuestion.ExecuteScalar());

                        for (int j = 0; j < 4; j++)
                        {
                            string insertChoiceQuery = "INSERT INTO Choice (ChoiceText, IsCorrect, QuestionId) VALUES (@ChoiceText, @IsCorrect, @QuestionId)";
                            SqlCommand cmdNewChoice = new SqlCommand(insertChoiceQuery, con);
                            cmdNewChoice.Parameters.AddWithValue("@ChoiceText", newChoiceTexts[(i * 4) + j]);
                            cmdNewChoice.Parameters.AddWithValue("@IsCorrect", newIsCorrectValues[i] == j.ToString() ? 1 : 0);
                            cmdNewChoice.Parameters.AddWithValue("@QuestionId", newQuestionId);
                            cmdNewChoice.ExecuteNonQuery();
                        }
                    }
                }
            }

            Response.Redirect("QuizList.aspx");
        }

        private void ShowErrorMessage(string message)
        {
            string script = $"alert('{message.Replace("'", "\\'").Replace("\n", "\\n").Replace("\r", "\\r")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
        }
    }
}