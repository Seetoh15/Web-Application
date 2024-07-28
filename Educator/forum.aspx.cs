using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Educator
{
    public partial class forum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dataAccess da = new dataAccess();
                DataTable dt = da.GetForumData();
                PostsGridView.DataSource = dt;
                PostsGridView.DataBind();
                PostsRepeater.DataSource = dt;
                PostsRepeater.DataBind();
            }
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
        }
    }
}