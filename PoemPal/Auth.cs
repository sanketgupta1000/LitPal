using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PoemPal
{
    public class Auth
    {
        public static bool IsLoggedIn()
        {
            return (HttpContext.Current.Session["IsLoggedIn"] != null && ((bool)HttpContext.Current.Session["IsLoggedIn"]) == true);
        }
    }
}