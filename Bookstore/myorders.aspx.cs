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
    public partial class myorders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["isLogged"] == null || !(bool)Session["isLogged"])
            {
                multiview.SetActiveView(verror);
            }
            else
            {
                maindataTableAdapters.ordersorderdetailsproductTableAdapter adapter = new maindataTableAdapters.ordersorderdetailsproductTableAdapter();
                DataTable ordersdata = adapter.GetData((int)Session["customerID"]);

                if (ordersdata.Rows.Count > 0)
                {
                    bool telos = false;
                    int oid = int.Parse(ordersdata.Rows[0]["ID"].ToString());
                    int total = 0;
                    HtmlTable table = new HtmlTable();
                    table.Attributes.Add("class","btable");

                    HtmlTableRow tr = new HtmlTableRow();

                    HtmlTableCell td = new HtmlTableCell();
                    td.Attributes.Add("align", "center");
                    td.Attributes.Add("colspan", "3");
                    td.InnerHtml = "<b>Order ID: " + ordersdata.Rows[0]["ID"].ToString() + "&nbsp&nbsp&nbsp&nbsp&nbsp" + "Date: "+ordersdata.Rows[0]["oDate"].ToString()+"</b>";
                    tr.Cells.Add(td);
                    table.Rows.Add(tr);

                    tr = new HtmlTableRow();
                    td = new HtmlTableCell();
                    td.Attributes.Add("class", "btd2");
                    td.Style.Add("text-align","center");
                    td.InnerHtml = "<b>Title</b>";
                    tr.Cells.Add(td);
                    td = new HtmlTableCell();
                    td.Attributes.Add("class", "btd3");
                    td.InnerHtml = "<b>Quantity</b>";
                    tr.Cells.Add(td);
                    td = new HtmlTableCell();
                    td.Attributes.Add("class", "btd3");
                    td.InnerHtml = "<b>Price</b>";
                    tr.Cells.Add(td);
                    table.Rows.Add(tr);

                    for (int i = 0; i < ordersdata.Rows.Count; i++)
                    {


                        if (int.Parse(ordersdata.Rows[i]["ID"].ToString()) == oid)
                        {

                            tr = new HtmlTableRow();
                            td = new HtmlTableCell();
                            td.Attributes.Add("class", "btd2");
                            td.InnerHtml = ordersdata.Rows[i]["Title"].ToString();
                            tr.Cells.Add(td);
                            td = new HtmlTableCell();
                            td.Attributes.Add("class", "btd3");
                            td.InnerHtml = ordersdata.Rows[i]["Quantity"].ToString();
                            tr.Cells.Add(td);
                            td = new HtmlTableCell();
                            td.Attributes.Add("class", "btd3");
                            td.InnerHtml = ordersdata.Rows[i]["Price"].ToString();
                            tr.Cells.Add(td);
                            table.Rows.Add(tr);

                            total += int.Parse(ordersdata.Rows[i]["Price"].ToString()) * int.Parse(ordersdata.Rows[i]["Quantity"].ToString());

                            
                            if (i == (ordersdata.Rows.Count-1))
                            {
                                telos = true;
                                tr = new HtmlTableRow();
                                td = new HtmlTableCell();
                                td.Attributes.Add("align", "center");
                                td.Attributes.Add("colspan", "3");
                                td.InnerHtml = "<b>Total price: " + total.ToString() + "</b>";
                                tr.Cells.Add(td);
                                table.Rows.Add(tr);


                                total = 0;
                                vorders.Controls.Add(table);
                            }
                            
                        }
                        else
                        {
                            if (!telos)
                            {
                                oid = int.Parse(ordersdata.Rows[i]["ID"].ToString());

                                tr = new HtmlTableRow();
                                td = new HtmlTableCell();
                                td.Attributes.Add("align", "center");
                                td.Attributes.Add("colspan", "3");
                                td.InnerHtml = "<b>Total price: " + total.ToString() + "</b>";
                                tr.Cells.Add(td);
                                table.Rows.Add(tr);


                                total = 0;
                                vorders.Controls.Add(table);

                            
                                vorders.Controls.Add(new HtmlGenericControl("br"));
                                vorders.Controls.Add(new HtmlGenericControl("br"));
                                //neo table
                                table = new HtmlTable();
                                table.Attributes.Add("class", "btable");

                                tr = new HtmlTableRow();

                                td = new HtmlTableCell();
                                td.Attributes.Add("align", "center");
                                td.Attributes.Add("colspan", "3");
                                td.InnerHtml = "<b>Order ID: " + ordersdata.Rows[i]["ID"].ToString() + "&nbsp&nbsp&nbsp&nbsp&nbsp" + "Date: " + ordersdata.Rows[i]["oDate"].ToString() + "</b>";
                                tr.Cells.Add(td);
                                table.Rows.Add(tr);

                                tr = new HtmlTableRow();
                                td = new HtmlTableCell();
                                td.Attributes.Add("class", "btd2");
                                td.Style.Add("text-align","center");
                                td.InnerHtml = "<b>Title</b>";
                                tr.Cells.Add(td);
                                td = new HtmlTableCell();
                                td.Attributes.Add("class", "btd3");
                                td.InnerHtml = "<b>Quantity</b>";
                                tr.Cells.Add(td);
                                td = new HtmlTableCell();
                                td.Attributes.Add("class", "btd3");
                                td.InnerHtml = "<b>Price</b>";
                                tr.Cells.Add(td);
                                table.Rows.Add(tr);

                                
                                tr = new HtmlTableRow();
                                td = new HtmlTableCell();
                                td.Attributes.Add("class", "btd2");
                                td.InnerHtml = ordersdata.Rows[i]["Title"].ToString();
                                tr.Cells.Add(td);
                                td = new HtmlTableCell();
                                td.Attributes.Add("class", "btd3");
                                td.InnerHtml = ordersdata.Rows[i]["Quantity"].ToString();
                                tr.Cells.Add(td);
                                td = new HtmlTableCell();
                                td.Attributes.Add("class", "btd3");
                                td.InnerHtml = ordersdata.Rows[i]["Price"].ToString();
                                tr.Cells.Add(td);
                                table.Rows.Add(tr);

                                total += int.Parse(ordersdata.Rows[i]["Price"].ToString()) * int.Parse(ordersdata.Rows[i]["Quantity"].ToString());
                                vorders.Controls.Add(table);
                                
                            }

                        }

                    }

                    multiview.SetActiveView(vorders);

                    

                }

            }
        }
    }
}
