using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;

namespace PoemPal
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // check if logged in
            if (Auth.IsLoggedIn())
            {
                // already logged in
                // redirect to home
                Response.Redirect("/Home.aspx");
            }

            if(IsPostBack)
            {
                HandleSignup();
            }

        }

        // signup handler method
        protected void HandleSignup()
        {
            // get the email
            string email = tbEmail.Text;

            // need to check if email taken or not

            // connect to DB
            SqlConnection con = new SqlConnection();

            try
            {
                using (con)
                {
                    con.ConnectionString = WebConfigurationManager.ConnectionStrings["DatabaseCon"].ConnectionString;
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandText = "SELECT * FROM Users WHERE Email=@Email;";
                    cmd.Parameters.AddWithValue("@Email", email);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        // email already taken
                        lblNotify.Text = "Email already taken";
                    }
                    else
                    {
                        // now need to send otp to email

                        // generate otp
                        string otp = Otp.Generate();

                        // send
                        EmailSender.Send(email, "Signup Email Verification", "OTP: " + otp);

                        // store things in session
                        Session["name"] = tbName.Text;
                        Session["email"] = tbEmail.Text;
                        Session["passwordHash"] = SecurePasswordHasher.Hash(tbPassword.Text);
                        Session["otp"] = otp;
                        Session["otpFor"] = OtpFor.Signup;
                        Session["otpExpirationTime"] = DateTime.Now.AddMinutes(1);

                        // redirect to verify email page
                        Response.Redirect("/VerifyOtp.aspx");
                    }
                }

            }
            catch (Exception ex)
            {
                lblNotify.Text = "An error occured, please try again later.";
                Debug.WriteLine(ex.Message);
            }

        }
    }
}