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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string user, command;
        SqlConnection sqlConectar = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);
        SqlCommand leerdatos, exeSql;
        SqlDataAdapter da;
        DataTable dt;
        bool editMode = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["current_section"] != null)
                {
                    this.user = Session["current_section"].ToString();
                    lb_user.Text = "Hello " + user;
                }
                else
                {
                    Response.Redirect("start.aspx");
                }
                tbDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                command = "select *from Matrix";
                LeerDatos(command); 
            }
                
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            editMode = false;
            tbProduct.Text = string.Empty;
            tbProvider.Text = string.Empty;
            DropDownList1.Text = "0";
            tbMark.Text = string.Empty;
            tbFormat.Text = string.Empty;
            tbPrice.Text = string.Empty;
            tbDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "$('#exampleModal').modal('show')", true);
        }

        protected void btn_out_Click(object sender, EventArgs e)
        {
            Session.Remove("current_section");
            Response.Redirect("start.aspx");
        }

        protected void search_bar_TextChanged(object sender, EventArgs e)
        {
            
            command = "select*from Matrix where " + select1.SelectedValue + " like '%" + search_bar.Text + "%'";
            LeerDatos(command);
            //Response.Redirect("home.aspx#sec-2");
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (tbProduct.Text != "" && tbProvider.Text != "" && tbPrice.Text != "")
            {
                SqlCommand cmd;
                if (editMode)
                {
                    SqlCommand cmd = new SqlCommand("update_data", sqlConectar){ CommandType = CommandType.StoredProcedure };
                    cmd.Connection.Open();
                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = tbProduct.Text;
                    cmd.Parameters.Add("@m_Product", SqlDbType.VarChar, 50).Value = tbProduct.Text;
                    cmd.Parameters.Add("@m_Provider", SqlDbType.VarChar, 50).Value = tbProvider.Text;
                    cmd.Parameters.Add("@m_Category", SqlDbType.TinyInt).Value = DropDownList1.Text;
                    cmd.Parameters.Add("@m_Mark", SqlDbType.VarChar, 50).Value = tbMark.Text;
                    cmd.Parameters.Add("@m_Format", SqlDbType.VarChar, 50).Value = tbFormat.Text;
                    cmd.Parameters.Add("@m_Price", SqlDbType.Float).Value = tbPrice.Text;
                    cmd.Parameters.Add("@m_User", SqlDbType.VarChar, 50).Value = Session["current_section"].ToString();
                    cmd.Parameters.Add("@m_Date", SqlDbType.Date).Value = tbDate.Text;
                    SqlDataReader dr = cmd.ExecuteReader();
                    dr.Close();
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("ingresar_datos", sqlConectar){
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Connection.Open();
                    cmd.Parameters.Add("@m_Product", SqlDbType.VarChar, 50).Value = tbProduct.Text;
                    cmd.Parameters.Add("@m_Provider", SqlDbType.VarChar, 50).Value = tbProvider.Text;
                    cmd.Parameters.Add("@m_Category", SqlDbType.TinyInt).Value = DropDownList1.Text;
                    cmd.Parameters.Add("@m_Mark", SqlDbType.VarChar, 50).Value = tbMark.Text;
                    cmd.Parameters.Add("@m_Format", SqlDbType.VarChar, 50).Value = tbFormat.Text;
                    cmd.Parameters.Add("@m_Price", SqlDbType.Float).Value = tbPrice.Text;
                    cmd.Parameters.Add("@m_User", SqlDbType.VarChar, 50).Value = Session["current_section"].ToString();
                    cmd.Parameters.Add("@m_Date", SqlDbType.Date).Value = tbDate.Text;
                    SqlDataReader dr = cmd.ExecuteReader();
                    dr.Close();

                    tbProduct.Text = string.Empty;
                    tbProvider.Text = string.Empty;
                    DropDownList1.Text = "0";
                    tbMark.Text = string.Empty;
                    tbFormat.Text = string.Empty;
                    tbPrice.Text = string.Empty;
                    tbDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

                    lblError.Text = "saved successfully";
                    lblError.CssClass = "alert-success";
                    Timer1.Enabled = true;

                    command = "select *from Matrix";
                    LeerDatos(command);
                }
                
            }
            else
            {
                if (tbProduct.Text == "") { tbProduct.BackColor = System.Drawing.ColorTranslator.FromHtml("#ffb5b5"); }
                if (tbProvider.Text == "") { tbProvider.BackColor = System.Drawing.ColorTranslator.FromHtml("#ffb5b5"); }
                if (tbPrice.Text == "") { tbPrice.BackColor = System.Drawing.ColorTranslator.FromHtml("#ffb5b5"); }

                lblError.Text = "complete the required fields";
                lblError.CssClass = "alert-danger";
                Timer1.Enabled = true;
            }
                  
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.Response.Write("<script>console.log('-------item---------------');</script>");
            
        }

        protected void rowCommand(object sender, GridViewCommandEventArgs e)
        {
            //int rowIndex = Convert.ToInt32(e.CommandArgument);
            //int id = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value);
            
        }

        protected void link_Click(object sender, EventArgs e)
        {
            editMode = true;
            LinkButton linkbutton = (LinkButton)sender;  // get the link button which trigger the event
            GridViewRow row = (GridViewRow)linkbutton.NamingContainer; // get the GridViewRow that contains the linkbutton
            int id = Convert.ToInt32(linkbutton.CommandArgument);

            command = "select *from Matrix WHERE id=" + id;
            SqlCommand cmd = new SqlCommand(command, sqlConectar);
            cmd.Connection.Open();
            //cmd.ExecuteNonQuery();

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                tbProduct.Text = reader["m_Product"].ToString();
                tbProvider.Text = reader["m_Provider"].ToString();
                DropDownList1.Text = reader["m_Category"].ToString();
                tbMark.Text = reader["m_Mark"].ToString();
                tbPrice.Text = reader["m_Price"].ToString();
                tbDate.Text = reader["m_Date"].ToString();
            }
            //try
            //{
            //    tbProvider.Text = linkbutton.CommandArgument;
            //    tbProduct.Text = row.Cells[1].Text;  // get the first cell value of the row
            //                                         // if you want to get controls in templatefield , just use row.FindControl
            //}
            //catch (Exception r)
            //{}




            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "$('#exampleModal').modal('show')", true);//show the modal
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            
        }

        protected void rowDelet(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            command = "DELETE FROM Matrix WHERE id=" + id;
            exeSql = new SqlCommand(command, sqlConectar);
            exeSql.Connection.Open();
            exeSql.ExecuteNonQuery();
            command = "select *from Matrix";
            LeerDatos(command);

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            tbProduct.BackColor = System.Drawing.ColorTranslator.FromHtml("#ffffff");
            tbProvider.BackColor = System.Drawing.ColorTranslator.FromHtml("#ffffff");
            tbPrice.BackColor = System.Drawing.ColorTranslator.FromHtml("#ffffff");
            lblError.Text = "";
            Timer1.Enabled = false;
        }

        
    }
}