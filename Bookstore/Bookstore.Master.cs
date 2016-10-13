using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Bookstore.database;

namespace Bookstore
{
    public partial class Bookstore : System.Web.UI.MasterPage
    {

        //private static bool start = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            if (start)
            {
                dbutils.connectionString += Server.MapPath("~/database/ebookstoredb.mdb");
                start = false;
            }
             * */

            if (Session["isLogged"]!=null&&(bool)Session["isLogged"])
            {

                lwelcome.Text ="Welcome "+ Session["username"] + ".";

                lusermenu.Text = "Μενού Πελάτη:";

                String[] Buttonnames = {"Εμφάνιση παραγγελιών","Στοιχεία πελάτη","Αποσύνδεση"};
                String[] Buttonids = {"myorders","mydetails","logout"};
                for (int i = 0; i < Buttonnames.Length; i++)
                {
                    Button linkButton = new Button();
                    linkButton.Text = Buttonnames[i];
                    linkButton.ID = Buttonids[i];
                    linkButton.Click += linkButton_Click;

                    HtmlGenericControl li = new HtmlGenericControl("li");
                    li.Controls.Add(linkButton);

                    usermenu.Controls.Add(li);
                }
            }

            if (Session["isAdmin"] != null && (bool)Session["isAdmin"])
            {
                ladminmenu.Text = "Μενού Διαχειριστή:";

                String[] Buttonnames = { "Λίστα πελατών", "Λίστα κατηγοριών", "Λίστα προϊόντων", "Λίστα παραγγελιών" };
                String[] Buttonids = { "Admincustomers","Admincategories", "Adminproducts", "Adminorders" };
                for (int i = 0; i < Buttonnames.Length; i++)
                {
                    Button linkButton = new Button();
                    linkButton.Text = Buttonnames[i];
                    linkButton.ID = Buttonids[i];
                    linkButton.Click += linkButton_Click;

                    HtmlGenericControl li = new HtmlGenericControl("li");
                    li.Controls.Add(linkButton);

                    adminmenu.Controls.Add(li);
                }
            }
        }

        void linkButton_Click(object sender, EventArgs e)
        {
            if (((Button)sender).ID != "logout")
            {
                Response.Redirect(((Button)sender).ID+".aspx");
            }
            else
            {
                Session.Abandon();
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}
