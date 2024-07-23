using System;
using System.Collections.Generic;
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
                dataAccess dataAccess = new dataAccess();
                GridView1.DataSource = dataAccess.GetData();
                GridView1.DataBind();
            }
        }
    }
}