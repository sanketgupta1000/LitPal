using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PoemPal
{
    public partial class UpdateContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Auth.IsLoggedIn())
                {
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    HandleUpdate();
                }
            }
        }


        private void HandleUpdate()
        {
            string id = Request.QueryString["id"];
            int.TryParse(id, out int postId);
            
            int uid = (int)Session["id"];

            DataSet ds = DataManager.GetFromCacheOrDatabase();

            DataRow[] drs = ds.Tables["Content"].Select($"Id = '{postId}'");

            string aid = drs[0]["Aid"].ToString();
            Debug.WriteLine(int.TryParse(aid, out int authorId));

            // If author of post is not current logged in user
            if (uid != authorId)
            {
                string url = $"/View.aspx?id={postId}";
                Response.Redirect(url);
            }

            if (drs[0]["Title"].ToString() != null)
            {
                tbTitle.Text = drs[0]["Title"].ToString();
            }
            else
            {
                tbTitle.Enabled = false;
                
            }
            if (drs[0]["Content"].ToString() != null)
            {
                tbContent.Text = drs[0]["Content"].ToString();
            }
            else
            {
                tbContent.Enabled = false;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            int.TryParse(id, out int postId);

            string title = tbTitle.Text;
            string content = tbContent.Text;

            Debug.WriteLine(title);
            Debug.WriteLine(content);
            DataManager.updateContent(postId, title, content);

            string url = $"/View.aspx?id={postId}";

            Response.Redirect(url);
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Home.aspx");
        }
    }
}