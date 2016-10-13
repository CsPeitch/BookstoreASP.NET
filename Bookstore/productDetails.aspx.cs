using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using Bookstore.model;

namespace Bookstore
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        int pid = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["pid"] != null)
            {
                try
                {
                    pid = int.Parse(Request.QueryString["pid"]);
                }
                catch (Exception exc)
                {
                    //do nothing
                }
            }
        }

        protected void baddtocart_Click(object sender, EventArgs e)
        {
            if (Session["isLogged"] != null && (bool)Session["isLogged"])
            {
                if (Session["cart"] == null)
                {
                    Session["cart"] = new ArrayList();
                }

                int quantity = int.Parse(tquantity.Text);
                cartitem item = new cartitem(quantity, pid);
                ((ArrayList)Session["cart"]).Add(item);

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('" + quantity.ToString() + " unit(s) added to cart');", true);
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}
