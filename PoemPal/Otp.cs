using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PoemPal
{
    public class Otp
    {
        public static string Generate()
        {
            return new Random().Next(100000, 999999).ToString();
        }
    }

    public enum OtpFor
    {
        Signup,
        ForgotPassword
    }
}