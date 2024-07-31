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
    public partial class editQuestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if post_id is provided in the query string
                if (Request.QueryString["question_id"] != null)
                {
                    int question_id;
                    // Parse the post_id from the query string
                    if (int.TryParse(Request.QueryString["question_id"], out question_id))
                    {
                        // Load the post details and comments
                        LoadQuestionDetails(question_id);
                    }
                }
            }
        }

        private void LoadQuestionDetails(int question_id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("SELECT question.question_text, choice.choice_text, choice.is_correct FROM question JOIN choice ON question.question_id = choice.question_id WHERE question.question_id = '" + question_id + "'", con);
            da.SelectCommand.Parameters.AddWithValue("@question_id", question_id);

            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                // Set the question text
                txtQuestion.Text = dt.Rows[0]["question_text"].ToString();

                // Set the choice texts and determine which radio button should be checked
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string choiceText = dt.Rows[i]["choice_text"].ToString();
                    bool isCorrect = Convert.ToBoolean(dt.Rows[i]["is_correct"]);

                    switch (i)
                    {
                        case 0:
                            TextBox1.Text = choiceText;
                            RadioButton1.Checked = isCorrect;
                            break;
                        case 1:
                            TextBox2.Text = choiceText;
                            RadioButton2.Checked = isCorrect;
                            break;
                        case 2:
                            TextBox3.Text = choiceText;
                            RadioButton3.Checked = isCorrect;
                            break;
                        case 3:
                            TextBox4.Text = choiceText;
                            RadioButton4.Checked = isCorrect;
                            break;
                    }
                }
            }
            con.Close();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtQuestion.Text.Trim() != "" & TextBox1.Text.Trim() != "" & TextBox2.Text.Trim() != "" & TextBox3.Text.Trim() != "" & TextBox4.Text.Trim() != "")
            {
                //int question_id = int.Parse(Request.QueryString["question_id"]);
                int question_id = 0;
                int quiz_id = 1;

                // Check if the question_id is available in the query string to determine if editing
                if (int.TryParse(Request.QueryString["question_id"], out question_id))
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();

                    // Get the quiz_id associated with the question
                    string selectQuery = "SELECT quiz_id FROM question WHERE question_id = @question_id";
                    SqlCommand selectCmd = new SqlCommand(selectQuery, con);
                    selectCmd.Parameters.AddWithValue("@question_id", question_id);

                    object result = selectCmd.ExecuteScalar();
                    if (result != null)
                    {
                        quiz_id = Convert.ToInt32(result);
                    }

                    SqlDataAdapter da = new SqlDataAdapter("select choice_id from choice where question_id = '" + question_id + "' ORDER BY choice_id OFFSET 0 ROWS FETCH NEXT 4 ROWS ONLY;", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    int choice1 = Convert.ToInt32(dt.Rows[0][0]);
                    int choice2 = Convert.ToInt32(dt.Rows[1][0]);
                    int choice3 = Convert.ToInt32(dt.Rows[2][0]);
                    int choice4 = Convert.ToInt32(dt.Rows[3][0]);

                    // Update the existing question
                    string queryUpdateQuestion = "UPDATE question SET question_text = @question_text WHERE question_id = '" + question_id + "'";
                    SqlCommand cmdUpdateQuestion = new SqlCommand(queryUpdateQuestion, con);
                    cmdUpdateQuestion.Parameters.AddWithValue("@question_text", txtQuestion.Text);
                    cmdUpdateQuestion.ExecuteNonQuery();

                    // Update choices associated with the question
                    UpdateChoice(con, TextBox1.Text, RadioButton1.Checked ? 1 : 0, question_id, choice1);
                    UpdateChoice(con, TextBox2.Text, RadioButton2.Checked ? 1 : 0, question_id, choice2);
                    UpdateChoice(con, TextBox3.Text, RadioButton3.Checked ? 1 : 0, question_id, choice3);
                    UpdateChoice(con, TextBox4.Text, RadioButton4.Checked ? 1 : 0, question_id, choice4);

                    con.Close();

                    Response.Redirect("editQuiz.aspx?quiz_id=" + quiz_id);
                }
                else
                {
                    string script = "alert('Invalid question ID.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
                }
            }
            else
            {
                string script = "alert('Please fill up the question title and all 4 choices.');";
                ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
            }
        }

        // Method to update a choice
        void UpdateChoice(SqlConnection connection, string choiceText, int isCorrect, int questionId, int choiceId)
        {
            string queryUpdateChoice = "UPDATE choice SET choice_text = @choice_text, is_correct = @is_correct WHERE choice_id = '" + choiceId + "'";
            using (SqlCommand cmd = new SqlCommand(queryUpdateChoice, connection))
            {
                cmd.Parameters.AddWithValue("@choice_text", choiceText);
                cmd.Parameters.AddWithValue("@is_correct", isCorrect);
                cmd.ExecuteNonQuery();
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            int question_id;
            int quiz_id = 1;
            if (int.TryParse(Request.QueryString["question_id"], out question_id))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Begin a transaction to ensure both delete operations succeed or fail together
                    SqlTransaction transaction = con.BeginTransaction();

                    try
                    {
                        // Get the quiz_id associated with the question
                        string selectQuery = "SELECT quiz_id FROM question WHERE question_id = @question_id";
                        SqlCommand selectCmd = new SqlCommand(selectQuery, con, transaction);
                        selectCmd.Parameters.AddWithValue("@question_id", question_id);

                        object result = selectCmd.ExecuteScalar();
                        if (result != null)
                        {
                            quiz_id = Convert.ToInt32(result);

                            // Delete choices related to the question
                            string deleteChoiceQuery = "DELETE FROM choice WHERE question_id = @question_id";
                            SqlCommand deleteChoiceCmd = new SqlCommand(deleteChoiceQuery, con, transaction);
                            deleteChoiceCmd.Parameters.AddWithValue("@question_id", question_id);
                            deleteChoiceCmd.ExecuteNonQuery();

                            // Delete the question itself
                            string deleteQuestionQuery = "DELETE FROM question WHERE question_id = @question_id";
                            SqlCommand deleteQuestionCmd = new SqlCommand(deleteQuestionQuery, con, transaction);
                            deleteQuestionCmd.Parameters.AddWithValue("@question_id", question_id);
                            deleteQuestionCmd.ExecuteNonQuery();

                            // Commit the transaction
                            transaction.Commit();
                        }
                        else
                        {
                            // Handle case where question_id is not found
                            transaction.Rollback();
                            string script = "alert('Error: Question not found.');";
                            ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Rollback the transaction if an error occurs
                        transaction.Rollback();
                        // Optionally, log the exception or display an error message
                        string script = $"alert('Error deleting question: {ex.Message}');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ShowErrorMessage", script, true);
                    }
                }
            }

            // Redirect back to the same page or another page after deletion
            Response.Redirect("editQuiz.aspx?quiz_id=" + quiz_id);
        }

    }
}