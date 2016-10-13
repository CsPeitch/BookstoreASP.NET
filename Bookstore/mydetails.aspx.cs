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
    public partial class mydetails : System.Web.UI.Page
    {
        static int xwra = 0;
        static int filo = 0;

        static bool edited = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (edited)
            {
                if (Session["isLogged"] != null && (bool)Session["isLogged"])
                {
                    MultiView1.SetActiveView(vform);
                }
                else { MultiView1.SetActiveView(verror); }
            }
            if (Session["isLogged"] != null && (bool)Session["isLogged"])
            {
                maindataTableAdapters.custDetailsTableAdapter customeradap = new maindataTableAdapters.custDetailsTableAdapter();
                DataTable data = customeradap.GetData((int)Session["customerID"]);

                lbonoma.Text = data.Rows[0]["Fname"].ToString();
                lbepitheto.Text = data.Rows[0]["Lname"].ToString();
                lbemail.Text = data.Rows[0]["email"].ToString();
                lbusername.Text = data.Rows[0]["uname"].ToString();
                lbaddress.Text = data.Rows[0]["Address"].ToString();
                lbtilefwno.Text = data.Rows[0]["Phone"].ToString();
                lbtk.Text = data.Rows[0]["tk"].ToString();
                lbpoli.Text = data.Rows[0]["poli"].ToString();
                if (int.Parse(data.Rows[0]["xwra"].ToString()) == 0)
                {
                    xwra = 0;
                    lbxwra.Text = "Ελλάδα";
                }
                else
                {
                    xwra = 1;
                    lbxwra.Text = "Other";
                }
                if (int.Parse(data.Rows[0]["filo"].ToString()) == 0)
                {
                    filo = 0;
                    lbfilo.Text = "Άνδρας";
                }
                else
                {
                    filo = 1;
                    lbfilo.Text = "Γυναίκα";
                }


                MultiView1.SetActiveView(vform);  
            }
            else { MultiView1.SetActiveView(verror); }

        }

        protected void bedit_Click(object sender, EventArgs e)
        {
            edited = false;

            tonoma.Text = lbonoma.Text;
            teponimo.Text = lbepitheto.Text;
            temail.Text = lbemail.Text;
            tdiefthinsi.Text = lbaddress.Text;
            ttilefwno.Text = lbtilefwno.Text;
            ttk.Text = lbtk.Text;
            tpoli.Text = lbpoli.Text;
            listxwra.SelectedIndex = xwra;
            if (filo == 0)
                randras.Checked = true;
            else
                rginaika.Checked = true;



            MultiView1.SetActiveView(veditform);
        }

        protected void bsave_Click(object sender, EventArgs e)
        {
            if (edited)
            {
                if (Session["isLogged"] != null && (bool)Session["isLogged"])
                {
                    MultiView1.SetActiveView(vform);
                }
                else { MultiView1.SetActiveView(verror); }
                return;
            }

            maindataTableAdapters.custDetailsTableAdapter adap = new maindataTableAdapters.custDetailsTableAdapter();
            xwra = listxwra.SelectedIndex;
            if (randras.Checked)
                filo = 0;
            else
                filo = 1;

            int access = 0;
            if ((bool)Session["isAdmin"] == true)
                access = 1;

            adap.UpdateQuery(tonoma.Text, teponimo.Text, tdiefthinsi.Text, ttilefwno.Text, access, temail.Text, tpoli.Text, xwra, filo, ttk.Text, (int)Session["customerID"]);

            lbonoma.Text = tonoma.Text;
            lbepitheto.Text = teponimo.Text;
            lbemail.Text = temail.Text;
            lbaddress.Text = tdiefthinsi.Text;
            lbtilefwno.Text = ttilefwno.Text;
            lbtk.Text = ttk.Text;
            lbpoli.Text = tpoli.Text;
            if (xwra == 0)
                lbxwra.Text = "Ελλάδα";
            else
                lbxwra.Text = "Other";
            if (filo == 0)
                lbfilo.Text = "Άνδρας";
            else
                lbfilo.Text = "Γυναίκα";

            MultiView1.SetActiveView(vform);

            edited = true;
        }
    }
}
