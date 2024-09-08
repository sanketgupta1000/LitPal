using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PoemPal
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //home page should be accessed iff logged in
            if(!Auth.IsLoggedIn())
            {
                Response.Redirect("/Login.aspx");
            }
            else if(!IsPostBack)
            {
                lblGreet.Text = "Hello, " + Session["name"];
            }

            //will populate the gridview for content

            string selectedType = DDLContentType.SelectedValue;

            // get the dataset
            DataSet ds = DataManager.GetFromCacheOrDatabase();

            Debug.WriteLine($"Type = '{selectedType}'");

            // create a view
            DataView dv = new DataView(ds.Tables["Content"]);
            int currentUser = (int)Session["id"];
            if(selectedType=="stories")
            {
                dv.RowFilter = "Type = 'Story'";
            }
            else if(selectedType=="poems")
            {
                dv.RowFilter = "Type = 'Poem'";
            }
            else if(selectedType == "your")
            {
                dv.RowFilter = $"Aid = {currentUser}";
            }

            // table of only the required columns
            DataTable dt = dv.ToTable(false, "Id", "Type", "Title", "Author", "Date");

            // bind to gdv
            GDVContent.DataSource = dt;
            GDVContent.DataBind();

        }

        protected void HandleLogout(object sender, EventArgs e)
        {
            // abandon the session
            Session.Abandon();

            // redirect to login
            Response.Redirect("/Login.aspx");
        }

        protected void HandleSelect(object sender, EventArgs e)
        {
            int index = GDVContent.SelectedIndex;
            GridViewRow selectedRow = GDVContent.Rows[index];
            int contentId = Convert.ToInt32(selectedRow.Cells[1].Text);

            // construct url
            string url = $"/View.aspx?id={contentId}";

            Response.Redirect(url);
        }
    }
}