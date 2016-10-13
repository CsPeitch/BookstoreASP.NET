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
	public partial class register : System.Web.UI.Page
	{
        static String onoma = "";
        static String epitheto = "";
        static String email = "";
        static String username = "";
        static String password = "";
        static String confirmpassword = "";
        static String address = "";
        static String tilefwno = "";
        static String tk = "";
        static String poli = "";
        static int xwra = 0;
        static int filo = -1;

        

		protected void Page_Load(object sender, EventArgs e)
		{ 
            lmessage.Style.Add("color","Red");

            if (Session["registered"]!=null)
            {
                if (MultiView1.GetActiveView() == acceptform)
                    Response.Redirect("login.aspx");
                return;
            }

            if (Session["isLogged"] != null && (bool)Session["isLogged"])
            {
                MultiView1.SetActiveView(error);
            }
            else { MultiView1.SetActiveView(form); }

            
		}

        protected void bregister_Click(object sender, EventArgs e)
        {

            onoma = tonoma.Text;
            epitheto = teponimo.Text;
            email = temail.Text;
            username = tusername.Text;
            password = tpassword.Text;
            confirmpassword = tconfirmpassword.Text;
            address = tdiefthinsi.Text;
            tilefwno = ttilefwno.Text;
            tk = ttk.Text;
            poli = tpoli.Text;
            xwra = Int32.Parse(listxwra.SelectedValue);
            String xxwra = "";

            if (xwra == 0)
                xxwra = "Ελλάδα";
            else
                xxwra = "Other";

            bool andras = randras.Checked;
            bool ginaika = rginaika.Checked;
            bool apodoxi = capodoxi.Checked;
            filo = -1;

            if (!apodoxi)
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Για να εγγραφείτε πρέπει να αποδεχτείτε τους όρους";
                return;
            }

            if (onoma == "")
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Δεν συμπληρώσατε όλα τα υποχρεωτικά πεδία";
                return;
            }
            if (epitheto == "")
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Δεν συμπληρώσατε όλα τα υποχρεωτικά πεδία";
                return;
            }
            if (email == "")
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Δεν συμπληρώσατε όλα τα υποχρεωτικά πεδία";
                return;
            }
            if (username == "")
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Δεν συμπληρώσατε όλα τα υποχρεωτικά πεδία";
                return;
            }
            if (password == "")
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Δεν συμπληρώσατε όλα τα υποχρεωτικά πεδία";
                return;
            }
            if (confirmpassword == "")
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Δεν συμπληρώσατε όλα τα υποχρεωτικά πεδία";
                return;
            }
            if (address == "")
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Δεν συμπληρώσατε όλα τα υποχρεωτικά πεδία";
                return;
            }
            if (tilefwno == "")
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Δεν συμπληρώσατε όλα τα υποχρεωτικά πεδία";
                return;
            }
            if (tk == "")
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Δεν συμπληρώσατε όλα τα υποχρεωτικά πεδία";
                return;
            }
            if (poli == "")
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Δεν συμπληρώσατε όλα τα υποχρεωτικά πεδία";
                return;
            }

            if (onoma.Contains("'") || epitheto.Contains("'") || email.Contains("'") || username.Contains("'") || password.Contains("'") || address.Contains("'") || tilefwno.Contains("'") || tk.Contains("'") || poli.Contains("'"))
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Ο χαρακτήρας ' δεν επιτρέπεται";
                return;
            }

            String ffilo = "";
            if (andras)
            {
                filo = 0;
                ffilo = "Άνδρας";
            }

            if (ginaika)
            {
                filo = 1;
                ffilo = "Γυναίκα";
            }
            /*
            String coninfo="";
            if ((coninfo=dbutils.openConnection()) != "connected")
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = coninfo;
                return;
            }

            
            String cmd = "select * from customer where uname='"+username+"'";
            Object[] result = dbutils.executeQuery(cmd);
            bool alreadyexists = false;
            if ((String)result[0] == "success")
            {
                OleDbDataReader reader = (OleDbDataReader)result[1];

                if (reader.HasRows)
                {
                    alreadyexists = true;
                }
            }
            else
            {
                lmessage.Text = (String)result[1];
                dbutils.closeConnection();
                return;
            }
             

            

            if (alreadyexists)
            {
                tusername.Text = "";
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Το όνομα χρήστη υπάρχει";
                dbutils.closeConnection();
                return;
            }
            */
            maindataTableAdapters.QueriesTableAdapter query = new maindataTableAdapters.QueriesTableAdapter();

            if (query.doesExist(username)!=null)
            {
                query.Dispose();
                tusername.Text = "";
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Το όνομα χρήστη υπάρχει";
                return;
            }
            query.Dispose();

            if (password != confirmpassword)
            {
                tpassword.Text = "";
                tconfirmpassword.Text = "";
                lmessage.Text = "Οι΄δύο κωδικοί δεν είναι ίδιοι";
                dbutils.closeConnection();
                return;
            }

            lbonoma.Text = onoma;
            lbepitheto.Text = epitheto;
            lbaddress.Text = address;
            lbemail.Text = email;
            lbfilo.Text = ffilo;
            lbpoli.Text = poli;
            lbtilefwno.Text = tilefwno;
            lbtk.Text = tk;
            lbusername.Text = username;
            lbxwra.Text = xxwra;

            dbutils.closeConnection();

            MultiView1.SetActiveView(acceptform);
        }

        protected void baccept_Click(object sender, EventArgs e)
        {
            if (Session["registered"]!=null)
            {
                return;
            }

            /*
            String coninfo = "";
            if ((coninfo = dbutils.openConnection()) != "connected")
            {
                lmessage.Text = coninfo;
                return;
            }

            Object[] result = dbutils.executeQuery("select ID from customer order by ID desc");
            int id = 0;
            if ((String)result[0] == "success")
            {
                OleDbDataReader reader = (OleDbDataReader)result[1];
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        id = reader.GetInt32(0);
                        id++;
                    }
                }
            }
            else
            {
                lbmessage.Text = (String)result[1];
                dbutils.closeConnection();
                return;
            }

            String cmd = "insert into customer values(" + id + ",'" + onoma + "','" + epitheto + "','" + address + "','" + tilefwno + "','" + username + "','" + password + "'," + 0 + ",'" + email + "','" + poli + "'," + xwra + "," + filo + ",'" + tk + "')";

            coninfo = "";
            if ((coninfo = dbutils.executeCommand(cmd)) != "success")
            {
                lbmessage.Text = coninfo;
                dbutils.closeConnection();
                return;
            }

            dbutils.closeConnection();
             */

            maindataTableAdapters.custDetailsTableAdapter customers = new maindataTableAdapters.custDetailsTableAdapter();
            if (customers.InsertQuery(onoma, epitheto, address, tilefwno, username, password, 0, email, poli, xwra, filo, tk) != 1)
            {
                lbmessage.Text = "Database insert error";
                customers.Dispose();
                return;
            }
            customers.Dispose();
            Session["registered"] = true;
            MultiView1.SetActiveView(regcomplete);
        }
	}
}
