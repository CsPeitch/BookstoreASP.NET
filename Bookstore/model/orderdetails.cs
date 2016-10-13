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
    public class orderdetails
    {
        public String oDate { get; set; }
        public int ID { get; set; }
        public int Quantity { get; set; }
        public String Title { get; set; }
        public int Price { get; set; }

        public orderdetails(String oDate, int ID, int Quantity, String Title, int Price)
        {
            this.oDate = oDate;
            this.ID = ID;
            this.Quantity = Quantity;
            this.Title = Title;
            this.Price = Price;
        }
    }
}
