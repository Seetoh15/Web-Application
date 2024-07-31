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
            int quiz_id = int.Parse(Request.QueryString["quiz_id"]);
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
            int quiz_id = int.Parse(Request.QueryString["quiz_id"]);
            string title = QuizTitle.Text.Trim();
            var questionTexts = Request.Form.GetValues("questionText");
            var choiceTexts = Request.Form.GetValues("choiceText");
            var isCorrectValues = Request.Form.GetValues("isCorrect");
            var deletedQuestions = Request.Form.GetValues("deletedQuestions");
            var deletedChoices = Request.Form.GetValues("deletedChoices");

            if (string.IsNullOrEmpty(title) || questionTexts == null || questionTexts.Length == 0)
            {
                ShowErrorMessage("Title and at least one Question are required.");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Update quiz
                string updateQuizQuery = "UPDATE Quiz SET Title = @Title WHERE QuizId = @QuizId";
                SqlCommand cmdQuiz = new SqlCommand(updateQuizQuery, con);
                cmdQuiz.Parameters.AddWithValue("@Title", title);
                cmdQuiz.Parameters.AddWithValue("@QuizId", quiz_id);
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
                        cmdNewQuestion.Parameters.AddWithValue("@QuizId", quiz_id);
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtQuestion.Text.Trim() != "" & TextBox1.Text.Trim() != "" & TextBox2.Text.Trim() != "" & TextBox3.Text.Trim() != "" & TextBox4.Text.Trim() != "")
            {
                int quiz_id = int.Parse(Request.QueryString["quiz_id"]);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                // Insert record into the question table and retrieve the inserted question_id
                string query1 = "INSERT INTO question (question_text, quiz_id) VALUES (@question_text, @quiz_id); SELECT SCOPE_IDENTITY();";
                SqlCommand cmd1 = new SqlCommand(query1, con);

                cmd1.Parameters.AddWithValue("@question_text", txtQuestion.Text);
                cmd1.Parameters.AddWithValue("@quiz_id", quiz_id);

                // Execute the command and retrieve the newly generated question_id
                object result = cmd1.ExecuteScalar();
                int question_id = Convert.ToInt32(result);

                // Prepare query for inserting choices
                string query2 = "INSERT INTO choice (choice_text, is_correct, question_id) VALUES (@choice_text, @is_correct, @question_id)";

                // Insert each choice with its is_correct value
                InsertChoice(con, query2, TextBox1.Text, RadioButton1.Checked ? 1 : 0, question_id);
                InsertChoice(con, query2, TextBox2.Text, RadioButton2.Checked ? 1 : 0, question_id);
                InsertChoice(con, query2, TextBox3.Text, RadioButton3.Checked ? 1 : 0, question_id);
                InsertChoice(con, query2, TextBox4.Text, RadioButton4.Checked ? 1 : 0, question_id);

                con.Close();

                Response.Redirect("editQuiz.aspx?quiz_id=" + quiz_id);
            }
            else
            {
                string script = $"alert('Please fill up the question title and all 4 choices.');";
                ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
            }
        }

        // Method to insert a choice
        void InsertChoice(SqlConnection connection, string query, string choiceText, int isCorrect, int questionId)
        {
            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                cmd.Parameters.AddWithValue("@choice_text", choiceText);
                cmd.Parameters.AddWithValue("@is_correct", isCorrect);
                cmd.Parameters.AddWithValue("@question_id", questionId);
                cmd.ExecuteNonQuery();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int quiz_id = 0;
            if (QuizTitle.Text.Trim() != "")
            {
                // Check if the question_id is available in the query string to determine if editing
                if (int.TryParse(Request.QueryString["quiz_id"], out quiz_id))
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();

                    SqlDataAdapter da = new SqlDataAdapter("select course_id from quiz where quiz_id = '" + quiz_id + "'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    int course_id = Convert.ToInt32(dt.Rows[0][0]);

                    // Update the existing question
                    string queryUpdateQuiz = "UPDATE quiz SET title = @title WHERE quiz_id = '" + quiz_id + "'";
                    SqlCommand cmdUpdateQuiz = new SqlCommand(queryUpdateQuiz, con);
                    cmdUpdateQuiz.Parameters.AddWithValue("@title", QuizTitle.Text);
                    cmdUpdateQuiz.ExecuteNonQuery();
                    con.Close();

                    Response.Redirect("courseContent.aspx?course_id=" + course_id);
                }
            }
            else
            {
                string script = $"alert('Quiz title cannot be empty!');";
                ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
            }
        }
    }   
}