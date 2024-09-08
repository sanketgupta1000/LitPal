using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
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
            if (!Auth.IsLoggedIn())
            {
                Response.Redirect("~/Login.aspx");
            }
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
            int uid = (int)Session["id"];
            int postAuthorId = (int)drs[0]["Aid"];

            if(uid != postAuthorId)
            {
                btnDelete.Visible = false;
                btnEdit.Visible = false;
            }

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

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string postId = Request.QueryString["id"];
            DataManager.deleteContent(postId);
            Response.Redirect("~/Home.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            int.TryParse(id, out int postId);

            //DataSet ds = DataManager.GetFromCacheOrDatabase();
            //DataRow[] drs = ds.Tables["Content"].Select($"Id = '{postId}'");

            
            //Session["Content"] = drs[0]["Content"].ToString();
            //Session["Title"] = drs[0]["Title"].ToString();
            //Session["Aid"] = drs[0]["Aid"].ToString();

            string url = $"/UpdateContent.aspx?id={postId}";
            Response.Redirect(url);

        }
    }
}