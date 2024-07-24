using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WAPP_Assignment.Educator
{
    public class dataAccess
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        public DataTable GetForumData()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT post.post_id, post.title, post.content, post.created_at, end_user.username, end_user.profile_pic, COUNT(comment.comment_id) AS comment_count FROM post JOIN end_user ON post.id = end_user.id LEFT JOIN comment ON post.post_id = comment.post_id GROUP BY post.post_id, post.title, post.content, post.created_at, end_user.username, end_user.profile_pic ORDER BY post.post_id", connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                return dataTable;
            }
        }

        public DataTable GetComment(int post_id)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT comment.content, comment.created_at, end_user.username, end_user.profile_pic FROM comment INNER JOIN end_user ON comment.id = end_user.id WHERE comment.post_id = '" + post_id + "' ORDER BY comment.created_at", connection);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);
                return dataTable;
            }
        }
    }

}