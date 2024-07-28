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

namespace WAPP_Assignment.Guest
{
    public partial class editProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!Page.IsPostBack)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter("select * from end_user where username = '" + Session["username"] + "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                username.Text = dt.Rows[0][1].ToString();
                password.Text = dt.Rows[0][2].ToString();
                name.Text = dt.Rows[0][3].ToString();
                //gender.SelectedItem.Text = dt.Rows[0][4].ToString();
                string genderValue = dt.Rows[0][4].ToString();

                // Check the value and set the corresponding selected index
                switch (genderValue)
                {
                    case "Male":
                        gender.SelectedIndex = gender.Items.IndexOf(gender.Items.FindByValue("Male"));
                        break;
                    case "Female":
                        gender.SelectedIndex = gender.Items.IndexOf(gender.Items.FindByValue("Female"));
                        break;
                    default:
                        // Handle unexpected value
                        gender.SelectedIndex = -1; // No selection
                        break;
                }
                email.Text = dt.Rows[0][5].ToString();
                profile_pic.ImageUrl = dt.Rows[0][6].ToString();
                img.Text = dt.Rows[0][6].ToString();
                user_type.SelectedItem.Text = dt.Rows[0][7].ToString();
                country.Text = dt.Rows[0][8].ToString();
            }
        }

        protected void ButtonSaveProfile_Click(object sender, EventArgs e)
        {
            try
            {
                //for file upload
                string folderPath = Server.MapPath("../ProfilePic/");

                //check whether Directory (Folder) exists
                if (!Directory.Exists(folderPath))
                {
                    //if Directory (Folder) does not exist, create it
                    Directory.CreateDirectory(folderPath);
                }

                string ImgPath = "";

                if (this.FileUpload1.HasFile)//to change profile pic
                {
                    string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png" };
                    if (Array.IndexOf(allowedExtensions, fileExtension) < 0)
                    {
                        // Display an error message or handle invalid file type
                        Response.Write("<script>alert('Please upload a valid image file (jpg, jpeg, png).');</script>");
                        return;
                    }
                    else
                    {
                        ImgPath = "../ProfilePic/" + this.FileUpload1.FileName.ToString();
                        //saving the photo to the file directory
                        FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));
                    }
                }
                else
                {
                    ImgPath = img.Text;
                }

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string query = "update end_user set password ='" + password.Text + "',name ='" + name.Text + "',gender ='" + gender.Text + "',email ='" + email.Text + "',profile_pic ='" + ImgPath + "',country ='" + country.Text + "' where username = '" + Session["username"] + "'";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
                //Response.Redirect("editProfile.aspx");

                ErrorMsg.Visible = false;
                SuccessMsg.Visible = true;
                SuccessMsg.ForeColor = System.Drawing.Color.Green;
                SuccessMsg.Text = "Edit profile successful!";
            }
            catch (Exception ex)
            {
                ErrorMsg.Visible = true;
                ErrorMsg.ForeColor = System.Drawing.Color.Red;
                ErrorMsg.Text = "Edit profile not successful!" + ex.ToString();
            }
        }
    }
}



