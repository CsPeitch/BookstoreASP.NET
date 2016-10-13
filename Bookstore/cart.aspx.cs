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
	public partial class cart : System.Web.UI.Page
	{
        bool isEmpty = true;
		protected void Page_Load(object sender, EventArgs e)
		{
            if (Session["isLogged"] != null && (bool)Session["isLogged"])
            {
                MultiView1.SetActiveView(vcart);
            }
            else
            {
                MultiView1.SetActiveView(verror);
            }

            if (Session["cart"] != null && ((ArrayList)Session["cart"]).Count > 0)
            {
                isEmpty = false;
                int rowindex = 1;
                int total = 0;

                maindataTableAdapters.productTableAdapter padapter = new maindataTableAdapters.productTableAdapter();
                DataTable data;

                foreach (cartitem item in (ArrayList)Session["cart"])
                {
                    data = padapter.GetDataBy(item.pid);

                    HtmlTableRow tr = new HtmlTableRow();
                    HtmlTableCell td1 = new HtmlTableCell();
                    HtmlTableCell td2 = new HtmlTableCell();
                    HtmlTableCell td3 = new HtmlTableCell();

                    td1.Attributes.Add("class", "btd2");
                    td2.Attributes.Add("class", "btd3");
                    td3.Attributes.Add("class", "btd3");

                    td1.InnerHtml = data.Rows[0]["Title"].ToString();
                    td2.InnerHtml = item.quantity.ToString();
                    td3.InnerHtml = data.Rows[0]["Price"].ToString();

                    tr.Cells.Add(td1);
                    tr.Cells.Add(td2);
                    tr.Cells.Add(td3);

                    carttable.Rows.Insert(rowindex,tr);
                    rowindex++;

                    total += item.quantity * int.Parse(data.Rows[0]["Price"].ToString());
                }

                ltotalprice.Text = total.ToString();
            }
		}

        protected void bbuy_Click(object sender, EventArgs e)
        {
            if (isEmpty)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('The cart is empty');", true);
            }
            else
            {
                maindataTableAdapters.ordersandetailsTableAdapter ordersadapter = new maindataTableAdapters.ordersandetailsTableAdapter();

                if(ordersadapter.InsertIntoOrders(int.Parse(Session["customerID"].ToString()), DateTime.Now)!=1)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('Sql error while trying to insert into orders');", true);
                    return;
                }

                int orderid = (int)ordersadapter.lastOrderIndex(int.Parse(Session["customerID"].ToString()));

                foreach(cartitem item in (ArrayList)Session["cart"])
                {
                    ordersadapter.InsertIntoOrderdetails(orderid,item.quantity, item.pid);
                }

                Session["cart"] = new ArrayList();
                MultiView1.SetActiveView(orderplaced);
            }
        }

        protected void bempty_Click(object sender, EventArgs e)
        {
            if (isEmpty)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "alert('The cart is empty');", true);
            }
            else
            {
                Session["cart"] = new ArrayList();
                Response.Redirect(Request.RawUrl);
            }
        }
	}
}
