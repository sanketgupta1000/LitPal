using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PoemPal
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string postIdStr = Request.QueryString["id"];
                if (int.TryParse(postIdStr, out int postId))
                {
                    LoadPost(postId);
                }
                else
                {
                    Response.Write("Invalid post ID.");
                }
            }
        }

        private void LoadPost(int postId)
        {

            // get the dataset
            DataSet ds = DataManager.GetFromCacheOrDatabase();

            // find the row
            DataRow[] drs = ds.Tables["Content"].Select($"Id = '{postId}'");

            if (drs.Length==1)
            {
                lblAuthor.Text = drs[0]["Author"].ToString();
                lblContent.Text = drs[0]["Content"].ToString();
                lblDate.Text = drs[0]["Date"].ToString();
                lblTitle.Text = drs[0]["Title"].ToString();
                lblType.Text = drs[0]["Type"].ToString();
            }
            else
            {
                Response.Write("Post not found");
            }

        }
    }
}