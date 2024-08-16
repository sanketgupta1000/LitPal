using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace PoemPal
{
    public class EmailSender
    {

        // static info
        static string from = "eventerteam0@gmail.com";
        static string server = "smtp.gmail.com";
        static int port = 587;
        static string password = "uapc rsra nldu lejs";

        public static void Send(string to, string subject, string mailBody)
        {
            // prepare message
            MailMessage message = new MailMessage(from, to);
            message.Subject = subject;
            message.Body = mailBody;
            message.BodyEncoding = Encoding.UTF8;

            // client
            SmtpClient client = new SmtpClient(server, port);

            System.Net.NetworkCredential basicCredential1 = new
System.Net.NetworkCredential(from, password);

            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;

            // send
            client.Send(message);
        }

    }
}