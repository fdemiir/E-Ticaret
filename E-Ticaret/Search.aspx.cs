using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) // == true            
                return;

            if (string.IsNullOrEmpty(Request.QueryString["AranacakDeger"]) == false)
            {
                // anasayfamdaki arama textBox'ındaki value -> buradaki textBox'ta da dolu gelsin ...
                txtAra.Text = Request.QueryString["AranacakDeger"];

                // Alttaki Arama(); metodum -> AranacakDeger'i -> Ürün veya Kategoride eşleştirip bulup getirmelidir ...
                Arama(Request.QueryString["AranacakDeger"]); // metodu altta ...
            }
        }

        Web.Library.ORMETicaretDBDataContext db = new Web.Library.ORMETicaretDBDataContext();
        private void Arama(string parameter)
        {
            string aranacakDeger = parameter.Replace("-", "").Replace("<", "").Replace("/", "").Replace("?", "");

            // aranacakDeger -> ürün isminde veya kategori isminde geçiyor mu onu karşılaştıracak ve verileri getirecek ... ( Eğer markalar da eklenirse o da || veya ile getirilebilir !!!)
            var result = from x in db.Products
                         where x.ProductName.Contains(aranacakDeger) == true || x.Category.CategoryName.Contains(aranacakDeger) == true
                         select x;

            DataList1.DataSource = result;
            DataList1.DataBind(); // unutmayın !!!
        }

        protected void btnAra_Click(object sender, EventArgs e)
        {
            Arama(txtAra.Text);
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
                        // buraya sepete ekle kodları kopyalanmalı !!!
                                                
                        // sayfayı tekrar kendine gönderme -> auto postBack özelliği gibi ...
                        Response.Redirect(Page.Request.Url.ToString());
                    }
                    break;
            }
        }
    }
}