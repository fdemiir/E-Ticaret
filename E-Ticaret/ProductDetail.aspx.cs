using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) // == true            
                return;

            // metotları altta ...

            // 1.
            UrunBilgisiniAl();

            // 2.
            BenzerUrunleriGetir();
        }

        Web.Library.ORMETicaretDBDataContext db = new Web.Library.ORMETicaretDBDataContext();

        public Web.Library.Product SelectedProduct
        {
            set;
            get;
        }

        // Category -> Product -> Seçili ürün ID'sini vb. tutacağım ve istediğim verileri çekeceğim metodum ...

        public string stokDurumu = "";
        public string kargoFiyati = "";

        // 1.
        private void UrunBilgisiniAl()
        {
            if (string.IsNullOrEmpty(Request.QueryString["ProductID"]) == true)
            {
                Response.Redirect("Default.aspx");
            }

            // ID'yi kaybolmasın diye sanalda bir yerde tutalım ... bunun için de bir HiddenField'e (veya ViewState'e) ihtiyacımız var -> Design kısmına geçip - ToolBox'tan bir HiddenField atıp geliyorum ...

            hfProductID.Value = Request.QueryString["ProductID"];

            int prodID = Convert.ToInt32(hfProductID.Value);
            // veya int prodID = Convert.ToInt32(Request.QueryString["ProductID"]);

            SelectedProduct = db.Products.FirstOrDefault(x => x.ProductID == prodID);

            // -------------------------------------------------------------

            if (SelectedProduct.UnitsInStock > 0) // yani stokta ürün varsa;
            {
                stokDurumu = "Stokta ...";
            }
            // isterseniz -> son 5 ürün vb., acele edin vb. için else if eklenebilir ...
            else // ürün bitmişse;
            {
                stokDurumu = " Tükendi !!!"; // veya "Stokta Yok !!!"
            }

            // -------------------------------------------------------------
            if (SelectedProduct.UnitPrice > 100) // mesela 100TL üzeri Kargo Bedava olsun ...
            {
                kargoFiyati = "Kargo Ücretsizdir ...";
            }
            else
            {
                kargoFiyati = "Kargo Müşteriye Aittir !!!";
            }
        }

        // 2.
        private void BenzerUrunleriGetir()
        {
            int? categoryId = SelectedProduct.CategoryID;

            db = new Web.Library.ORMETicaretDBDataContext();

            var result = from x in db.Products where x.CategoryID == categoryId select x;

            DataList1.DataSource = result.Take(3).ToList();
            // DataList'ime çoklu veriden sadece ilk 3 adedi gelecek ...
            DataList1.DataBind(); // unutmayın !!!
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument.ToString());

            switch (e.CommandName)
            {
                // Detay
                case "details":
                    {
                        Response.Redirect("~/ProductDetail.aspx?ProductId=" + productId.ToString());
                    }
                    break;

                // Sepete Ekle
                case "addToCart":
                    {
                        Response.Write("Ürününüz Sepete Eklenmiştir ...");
                    }
                    break;
            }
        }

        protected void lbtnSepeteEkle_Click(object sender, EventArgs e)
        {
            db = new Web.Library.ORMETicaretDBDataContext();

            Web.Library.Product selectedProd = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt32(hfProductID.Value));

            List<Web.Library.Cart.CartProduct> currentItemsEnd = Web.Library.Cart.CartTools.GetAllCartProduct(Session["myCart"]);

            currentItemsEnd.Add(new Web.Library.Cart.CartProduct()
            {
                Quantity = 1,
                SelectedProduct = (Web.Library.Product)selectedProd
            });

            SelectedProduct = selectedProd;
            Session["myCart"] = currentItemsEnd;

            // sayfayı tekrar kendine gönderme -> auto postBack özelliği gibi ...
            Response.Redirect(Page.Request.Url.ToString());
        }

        protected void lbtnUrunKarsilastir_Click(object sender, EventArgs e)
        {
            db = new Web.Library.ORMETicaretDBDataContext();

            // 1a.
            Web.Library.Product selectedProduct = db.Products.FirstOrDefault(p => p.ProductID == Convert.ToInt32(hfProductID.Value));

            // 2a.
            List<Web.Library.Product> comparableItemsEnd = Web.Library.Compare.CompareTools.AddCompare(Session["myComparable"], selectedProduct);

            // 1b.
            SelectedProduct = selectedProduct;
            // 2b.
            Session["myComparable"] = comparableItemsEnd;

            // sayfayı tekrar kendine gönderme -> auto postBack özelliği gibi ...
            Response.Redirect(Page.Request.Url.ToString());
        }
    }
}