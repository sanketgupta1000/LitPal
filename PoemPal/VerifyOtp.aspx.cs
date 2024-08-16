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
    public partial class VerifyOtp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // this page can be accessed if user is not logged in and otp is set in session
            if (Auth.IsLoggedIn())
            {
                Response.Redirect("/Home.aspx");
            }
            else if (Session["otp"] == null)
            {
                Response.Redirect("/Login.aspx");
            }

            if(IsPostBack)
            {
                HandleVerifyOtp();
            }
        }

        protected void HandleVerifyOtp()
        {
            try
            {
                if (tbOtp.Text == Session["otp"].ToString())
                {
                    if (DateTime.Now > (DateTime)Session["otpExpirationTime"])
                    {
                        // otp expired
                        lblNotify.Text = "OTP is expired";
                    }
                    else
                    {
                        // otp not expired

                        // check for which case otp is
                        if ((OtpFor)Session["otpFor"] == OtpFor.Signup)
                        {
                            // for signup

                            string conStr = WebConfigurationManager.ConnectionStrings["DatabaseCon"].ConnectionString;
                            string name = (string)Session["name"];
                            string email = (string)Session["email"];
                            string passwordHash = (string)Session["passwordHash"];

                            SqlConnection con = new SqlConnection();
                            con.ConnectionString = conStr;
                            SqlCommand cmd = con.CreateCommand();
                            cmd.Connection = con;
                            cmd.CommandText = "INSERT into Users (Name, Email, PasswordHash) Values (@name, @email, @passwordHash) SELECT SCOPE_IDENTITY();";
                            cmd.Parameters.AddWithValue("@name", name);
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@passwordHash", passwordHash);
                            con.Open();
                            object i = cmd.ExecuteScalar();
                            con.Close();
                            if (i != null)
                            {
                                // successfully inserted
                                Session.Remove("passwordHash");
                                Session.Remove("otp");
                                Session.Remove("otpFor");
                                Session.Remove("otpExpirationTime");

                                // log in
                                Session["IsLoggedIn"] = true;
                                Session["id"] = Convert.ToInt32(i);

                                // to home now
                                Response.Redirect("/Home.aspx");
                            }
                        }
                    }

                }
                {
                    lblNotify.Text = "Invalid OTP";
                }
            }
            catch (Exception ex)
            {
                lblNotify.Text = "An error occured. Please try again later.";
            }

        }
    }
}