using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Glassgow_v1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["current_section"] != null)
            {
                user = Session["current_section"].ToString();
                lb_user.Text = "Hello " + user;
            }
            else
            {
                Response.Redirect("start.aspx");
            }
        }

        protected void btn_out_Click(object sender, EventArgs e)
        {
            Session.Remove("current_section");
            Response.Redirect("start.aspx");
        }

        protected void search_bar_TextChanged(object sender, EventArgs e)
        {
            
        }

    }
}