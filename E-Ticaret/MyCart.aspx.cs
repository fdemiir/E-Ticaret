using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class MyCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) // == true            
                return;

            sepetiDoldur(); // metodu altta ...
        }

        public decimal? TotalPrice { get; set; } // ? -> Nullable (boş olam durumunda hata vermeyecek !)

        private void sepetiDoldur()
        {
            List<Web.Library.Cart.CartProduct> listemiz = (List<Web.Library.Cart.CartProduct>)Session["myCart"];

            if (listemiz != null)
            {
                rptMyCart.DataSource = listemiz;
                rptMyCart.DataBind(); // unutmayın !!!

                decimal? total = 0;

                foreach (var li in listemiz)
                {
                    total += (li.Quantity * li.UnitPrice);
                }
                this.TotalPrice = total;
            }
        }

        Web.Library.ORMETicaretDBDataContext db = new Web.Library.ORMETicaretDBDataContext();
        protected void rptMyCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                // Sepete Ekle
                case "addToCart":
                    {
                        int prodId = Convert.ToInt32(e.CommandArgument.ToString());

                        List<Web.Library.Cart.CartProduct> currentItems = Web.Library.Cart.CartTools.GetAllCartProduct(Session["myCart"]);

                        Web.Library.Product selectedProd = db.Products.FirstOrDefault(p => p.ProductID == prodId);

                        currentItems.Add(new Web.Library.Cart.CartProduct()
                        {
                            Quantity = 1,
                            SelectedProduct = (Web.Library.Product)selectedProd
                        });

                        Session["myCart"] = currentItems;
                    }
                    break;
            }
        }

        protected void btnSecilenleriKaldir_Click(object sender, EventArgs e)
        {
            List<Web.Library.Cart.CartProduct> listemiz = (List<Web.Library.Cart.CartProduct>)Session["myCart"];

            if (listemiz != null)
            {
                List<Web.Library.Cart.CartProduct> kaldirilacaklar = new List<Web.Library.Cart.CartProduct>();

                foreach (RepeaterItem rptItem in rptMyCart.Items)
                {
                    CheckBox chk = rptItem.FindControl("chkCheck") as CheckBox;

                    if (chk.Checked) // veya == true
                    {
                        HiddenField hf = rptItem.FindControl("hfProductID") as HiddenField;

                        if (string.IsNullOrEmpty(hf.Value) == false)
                        {
                            int id = Convert.ToInt32(hf.Value);

                            foreach (var prod in listemiz)
                            {
                                if (prod.ProductId == id)
                                {
                                    kaldirilacaklar.Add(prod);                    
                                }
                            }
                        }
                    }
                }

                // ---------------------------------------------------

                // kaldirilacaklar içindeki verileri başka bir foreach ile sildirelim ...

                foreach (var silinen in kaldirilacaklar)
                {
                    listemiz.Remove(silinen);
                }
                Session["myCart"] = listemiz;

                // sayfayı tekrar kendine gönderme -> auto postBack özelliği gibi ...
                Response.Redirect(Page.Request.Url.ToString());

                // ----------------------------------------------------

                sepetiDoldur();
            }
        }
    }
}