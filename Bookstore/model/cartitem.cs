using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace Bookstore.model
{
    public class cartitem
    {
        public int quantity { get; set; }
        public int pid { get; set; }

        public cartitem(int quantity, int pid)
        {
            this.quantity = quantity;
            this.pid = pid;
        }
    }
}
