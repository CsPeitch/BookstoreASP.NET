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

namespace Bookstore
{
    public partial class Adminorders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLogged"] == null || !(bool)Session["isLogged"])
                MultiView1.SetActiveView(verror);
            else if (!(bool)Session["isAdmin"])
                MultiView1.SetActiveView(verror2);
            else
                MultiView1.SetActiveView(vtable);

        }
    }
}
