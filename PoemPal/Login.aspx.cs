using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PoemPal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Auth.IsLoggedIn())
            {
                Response.Redirect("/Home.aspx");
            }

            if(IsPostBack)
            {
                HandleLogin();
            }

        }

        protected void HandleLogin()
        {
            string email = tbEmail.Text;
            string password = tbPassword.Text;
            string conStr = WebConfigurationManager.ConnectionStrings["DatabaseCon"].ConnectionString;

            SqlConnection con = new SqlConnection();
            try
            {
                con.ConnectionString = conStr;
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SELECT * FROM Users WHERE Email=@email;";
                cmd.Parameters.AddWithValue("@email", email);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                bool isValid = true;
                if (reader.HasRows)
                {
                    reader.Read();
                    isValid = SecurePasswordHasher.Verify(password, reader.GetString(3));
                }
                else
                {
                    isValid = false;
                }

                if (isValid)
                {
                    // valid credentials
                    Session["id"] = reader.GetInt32(0);
                    Session["name"] = reader.GetString(1);
                    Session["email"] = email;
                    Session["IsLoggedIn"] = true;

                    Response.Redirect("/Home.aspx");
                }
                else
                {
                    lblNotify.Text = "Incorrect email or password";
                }


            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.StackTrace);
                lblNotify.Text = "An error occured. Please try again later";
            }
            finally
            {
                con.Close();
            }
        }
    }
}