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
	public partial class products : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            int catid = 1;
            if (Request.QueryString["catid"] != null)
            {
                try
                {
                    catid = int.Parse(Request.QueryString["catid"]);
                }
                catch (Exception exc)
                {
                    //do nothing
                }

            }

            maindataTableAdapters.QueriesTableAdapter qs = new maindataTableAdapters.QueriesTableAdapter();
            lmessage.Text = qs.getCategoryName(catid);


		}
	}
}
