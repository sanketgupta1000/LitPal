using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PoemPal
{
    public partial class CreateNewContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Auth.IsLoggedIn())
            {
                Response.Redirect("/Login.aspx");
            }

            if(IsPostBack)
            {
                HandleSubmission();
            }

        }

        protected void HandleSubmission()
        {
            string title = tbTitle.Text;
            string content = tbContent.Text;
            string type;

            if(ddlType.SelectedValue=="1")
            {
                type = "Story";
            }
            else
            {
                type = "Poem";
            }

            DateTime date = DateTime.Now;

            int authorId = Convert.ToInt32(Session["id"]);

            // insert, update cache, get id
            int contentId = DataManager.InsertContentAndUpdateCache(type, title, content, date, authorId);

            // redirect to view page
            Response.Redirect($"/View.aspx?id={contentId}");
            //Response.Redirect("/Home.aspx");
        }
    }
}