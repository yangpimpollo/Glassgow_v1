using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Glassgow_v1
{
    public partial class main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["current_section"] != null)
            {
                string user = Session["current_section"].ToString();
                lblBienvenida.Text = "welcome " + user;
            }else
            {
                Response.Redirect("index.aspx");
            }
        }

        protected void BtnCerrar_Click1(object sender, EventArgs e)
        {
            lblBienvenida.Text = "log out";
            Session.Remove("current_section");
            Response.Redirect("index.aspx");
        }
    }
}