﻿using System;
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
    public partial class comment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if post_id is provided in the query string
                if (Request.QueryString["post_id"] != null)
                {
                    int post_id;
                    // Parse the post_id from the query string
                    if (int.TryParse(Request.QueryString["post_id"], out post_id))
                    {
                        // Load the post details and comments
                        LoadPostDetails(post_id);
                        LoadComments(post_id);
                    }
                }
            }
        }

        private void LoadPostDetails(int post_id)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter("SELECT post.title, post.content, end_user.username, end_user.profile_pic, post.created_at, post.image FROM post JOIN end_user ON post.id = end_user.id WHERE post.post_id = '" + post_id + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            litTitle.Text = dt.Rows[0][0].ToString();
            litContent.Text = dt.Rows[0][1].ToString();
            litUsername.Text = dt.Rows[0][2].ToString();
            if (dt.Rows[0][3].ToString() == "")
            {
                imgProfilePic.ImageUrl = "../image/pp.png";
            } else
            {
                imgProfilePic.ImageUrl = dt.Rows[0][3].ToString();
            }
            litCreatedAt.Text = dt.Rows[0][4].ToString();
            if (dt.Rows[0][5].ToString() == "")
            {
                postImage.Visible = false;
            } else
            {
                postImage.ImageUrl = dt.Rows[0][5].ToString();
                postImage.Visible = true;
            }
        }

        private void LoadComments(int post_id)
        {
            dataAccess da = new dataAccess();
            DataTable dt = da.GetComment(post_id);
            CommentRepeater.DataSource = dt;
            CommentRepeater.DataBind();
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
    }
}