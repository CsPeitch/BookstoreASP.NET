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
using Bookstore.database;
using System.Data.OleDb;

namespace Bookstore
{
	public partial class login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (Session["registered"] != null)
            {
                Session["registered"] = null;
            }
            lmessage.Style.Add("color", "Red");
            if (Session["isLogged"] != null && (bool)Session["isLogged"])
            {
                multiview.SetActiveView(error);
                return;
            }
            multiview.SetActiveView(form);
		}

        protected void blogin_Click(object sender, EventArgs e)
        {
            String u = tusername.Text;
            String p = tpassword.Text;

            /*
            String mes="";
            bool logged = false;

            
            if ((mes = dbutils.openConnection()) != "connected")
            {
                lmessage.Text = mes;
                return;
            }

            Object[] result=dbutils.executeQuery("select uname, passwd, access, ID from customer");

            if ((String)result[0] == "success")
            {
                OleDbDataReader reader = (OleDbDataReader)result[1];

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        if (u == reader.GetString(0))
                            if (p == reader.GetString(1))
                            {
                                logged = true;
                                Session["username"] = u;
                                Session["isLogged"] = true;
                                Session["customerID"] = reader.GetInt32(3);

                                if (reader.GetInt32(2) == 1)
                                    Session["isAdmin"] = true;
                                else
                                    Session["isAdmin"] = false;
                            }
                    }
                }
                dbutils.closeConnection();
            }
            else
            {
                lmessage.Text=(String)result[1];
                return;
            }

            if (logged)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                
            }
             */

            maindataTableAdapters.customerLogTableAdapter tadap = new maindataTableAdapters.customerLogTableAdapter();
            DataTable data = tadap.GetData(u);
            tadap.Dispose();

            if (data.Rows.Count > 0)
            {
                if (p == data.Rows[0]["passwd"].ToString())
                {
                    Session["username"] = u;
                    Session["isLogged"] = true;
                    Session["customerID"] = (int)data.Rows[0]["ID"];

                    if ((int)data.Rows[0]["access"] == 1)
                        Session["isAdmin"] = true;
                    else
                        Session["isAdmin"] = false;

                    Response.Redirect("Default.aspx");
                }
                else
                {
                    tpassword.Text = "";
                    lmessage.Text = "Wrong username or password";
                }
            }
            else
            {
                tpassword.Text = "";
                lmessage.Text = "Wrong username or password";
            }
        }

        protected void lbrecpass_Click(object sender, EventArgs e)
        {
            Response.Redirect("recpass.aspx");
        }

        protected void lbregister_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }
	}
}
