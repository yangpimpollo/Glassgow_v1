using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Glassgow_v1
{
    public partial class start : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        string patron = "Diana";
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            SqlConnection sqlConectar = new SqlConnection(conectar);
            SqlCommand cmd = new SqlCommand("SP_ValidarUsuario", sqlConectar)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Connection.Open();
            cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 50).Value = tbUsuario.Text;
            cmd.Parameters.Add("@Contrasenia", SqlDbType.VarChar, 50).Value = tbPassword.Text;
            cmd.Parameters.Add("@Patron", SqlDbType.VarChar, 50).Value = patron;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["current_section"] = tbUsuario.Text;
                Response.Redirect("home.aspx");
            }
            else
            {
                if(tbUsuario.Text == "" && tbPassword.Text == "")
                {
                    lblError.Text = "Insert credentials";
                    Timer1.Enabled = true;
                }else if (tbUsuario.Text == "" && tbPassword.Text != "")
                {
                    lblError.Text = "Insert user";
                    Timer1.Enabled = true;
                }else if (tbUsuario.Text != "" && tbPassword.Text == "")
                {
                    lblError.Text = "Insert password";
                    Timer1.Enabled = true;
                }
                else
                {
                    tbUsuario.Text = "";
                    lblError.Text = "Incorrect credentials";
                    Timer1.Enabled = true;
                }
                    
                

            }
            cmd.Connection.Close();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblError.Text= "";
            Timer1.Enabled = false;
        }
    }
}