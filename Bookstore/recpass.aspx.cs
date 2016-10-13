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
using System.Data.OleDb;
using Bookstore.database;

namespace Bookstore
{
    public partial class recpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lmessage.Style.Add("color","Red");
        }

        protected void bsend_Click(object sender, EventArgs e)
        {
            bool exists = false;

            if (temail.Text.Contains("'"))
            {
                lmessage.Text = "Ο χαρακτήρας ' δεν επιτρέπεται";
                temail.Text = "";
                return;
            }

            String coninfo = "";
            if ((coninfo = dbutils.openConnection()) != "connected")
            {
                lmessage.Text = coninfo;
                return;
            }

            String cmd = "select * from customer where email='" + temail.Text + "'";
            Object[] result = dbutils.executeQuery(cmd);
            if ((String)result[0] == "success")
            {
                OleDbDataReader reader = (OleDbDataReader)result[1];

                if (reader.HasRows)
                {
                    exists = true;
                }
            }
            else
            {
                lmessage.Text = (String)result[1];
                dbutils.closeConnection();
                return;
            }

            if (exists)
            {
                lemail.Visible = false;
                temail.Visible = false;
                bsend.Visible = false;
                lmessage.Style.Remove("color");
                lmessage.Text = "To email έχει αποσταλεί";
            }
            else
            {
                temail.Text = "";
                lmessage.Text = "Το email που δώσατε δεν ανήκει σε εγγεγραμμένο χρήστη";
            }
            dbutils.closeConnection();
        }
    }
}
