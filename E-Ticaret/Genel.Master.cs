using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class Genel : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) // == true            
                return;

            sepettekiUrunlerimiz(); // master - sağ üstteki sepet görseli için ...
        }

        // -------------------------------------------------------------
        public int? ProductQuantity { get; set; } // Urun adedi için ...
        public decimal? TotalPrice { get; set; } // Toplam için ...
        // -------------------------------------------------------------
        private void sepettekiUrunlerimiz()
        {
            List<Web.Library.Cart.CartProduct> listemiz = (List<Web.Library.Cart.CartProduct>)Session["myCart"];

            if (listemiz != null)
            {
                int? urun = 0;
                urun = listemiz.Count();
                this.ProductQuantity = urun; // Urun Adedimiz ...
                // ----------------------------------------------
                decimal? total = 0;

                foreach (var li in listemiz)
                {
                    total += (li.Quantity * li.UnitPrice);
                }
                this.TotalPrice = total; // Toplam ...
            }
        }
        // -------------------------------------------------------------

        protected void imgSearch_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Search.aspx?AranacakDeger=" + txtArananDeger.Text);
        }

        protected void lbtUrunKarsilastirma_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ComparedProducts.aspx");
        }
    }
}