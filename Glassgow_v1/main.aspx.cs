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
    public partial class main : System.Web.UI.Page
    {
        string user, command;
        SqlConnection sqlConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
        SqlCommand leerdatos;
        SqlDataAdapter da;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["current_section"] != null)
            {
                user = Session["current_section"].ToString();
                lblBienvenida.Text = "welcome " + user;
            } else
            {
                Response.Redirect("index.aspx");
            }
            TextBox5.Text = DateTime.Now.ToString("yyyy-MM-dd");
            command = "select *from Matrix";
            LeerDatos(command);
        }

        protected void BtnCerrar_Click1(object sender, EventArgs e)
        {
            //lblBienvenida.Text = "log out";
            Session.Remove("current_section");
            Response.Redirect("index.aspx");
        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {
            lblBienvenida.Text = TextBox6.Text;
            command = "select*from Matrix where m_Product like '%" + TextBox6.Text + "%'";
            LeerDatos(command);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            command = "select*from Matrix where m_Product like '%" + TextBox6.Text + "%'";
            LeerDatos(command);
        }

        //protected void btfecha_Click(object sender, EventArgs e)
        //{
        //    lbfecha.Text = TextBox6.Text;
        //}

        protected void btnSave_Click(object sender, EventArgs e)
        { 
            //lbfecha.Text = DropDownList1.Text;
            if(tbProduct.Text!="" && TextBox1.Text != "" && TextBox3.Text != "")
            {
                
                SqlCommand cmd = new SqlCommand("ingresar_datos", sqlConectar)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Connection.Open();
                cmd.Parameters.Add("@m_Product", SqlDbType.VarChar, 50).Value = tbProduct.Text;
                cmd.Parameters.Add("@m_Provider", SqlDbType.VarChar, 50).Value = TextBox1.Text;
                cmd.Parameters.Add("@m_Category", SqlDbType.TinyInt).Value = DropDownList1.Text;
                cmd.Parameters.Add("@m_Mark", SqlDbType.VarChar, 50).Value = TextBox2.Text;
                cmd.Parameters.Add("@m_Format", SqlDbType.VarChar, 50).Value = TextBox4.Text;
                cmd.Parameters.Add("@m_Price", SqlDbType.Float).Value = TextBox3.Text;
                cmd.Parameters.Add("@m_User", SqlDbType.VarChar, 50).Value = user;
                cmd.Parameters.Add("@m_Date", SqlDbType.Date).Value = TextBox5.Text;
                SqlDataReader dr = cmd.ExecuteReader();

                tbProduct.Text = string.Empty;
                TextBox1.Text = string.Empty;
                DropDownList1.Text = "0";
                TextBox2.Text = string.Empty;
                TextBox4.Text = string.Empty;
                TextBox3.Text = string.Empty;
                TextBox5.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
            else
            {
                /*if(tbProduct.Text == "") { tbProduct.BackColor = System.Drawing.ColorTranslator.FromHtml("#ffb5b5"); }*/

            }
        }


        void LeerDatos(string command)
        {
            leerdatos = new SqlCommand(command, sqlConectar);
            da = new SqlDataAdapter(leerdatos);
            dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}