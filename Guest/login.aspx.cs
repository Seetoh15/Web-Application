using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAPP_Assignment.Guest
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                SqlCommand cmd = new SqlCommand("Select count(*) from userTable where username = '" +
                    username.Text + "' and Password = '" + pwd.Text + " ' ", con);
                int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());

                if (count > 0)
                {
                    SqlCommand cmdType = new SqlCommand("select fname, usertype from userTable where username = '" + username.Text + " ' ", con);

                    SqlDataReader dr = cmdType.ExecuteReader();

                    String type = " ";
                    String name = " ";

                    while (dr.Read())
                    {
                        type = dr["usertype"].ToString().Trim();
                        name = dr["fname"].ToString().Trim();
                    }
                    Session["userName"] = username.Text;

                    if (type == "admin")
                        Response.Redirect("adminDashboard.aspx");
                    else if (type == "member")
                        Response.Redirect("memberDashboard");
                }
                else
                {
                    errorMsg.Visible = true;
                    errorMsg.ForeColor = System.Drawing.Color.Red;
                    errorMsg.Text = "Username and Password mismatch!";
                    return;
                }
                con.Close();
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("signIn.aspx");
        }
    }

}
