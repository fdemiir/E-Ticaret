using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)           
                return;

            ProductFill();
        }

        Web.Library.ORMETicaretDBDataContext db = new Web.Library.ORMETicaretDBDataContext();
        private void ProductFill()
        {
            if (string.IsNullOrEmpty(Request.QueryString["CategoryID"]) != true)
            {
                //CategoryID'si seçili olan ürünler

                var result = from x in db.Products
                             where x.CategoryID == Convert.ToInt32(Request.QueryString["CategoryID"])
                             select x;

                DataList1.DataSource = result;
            }
            else
            {
                // CategoryID'si yoksa 
                var result = from x in db.Products select x;

                DataList1.DataSource = result;
            }
            DataList1.DataBind();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument.ToString());

            switch (e.CommandName)
            {
                case "details":
                    {
                        Response.Redirect("~/ProductDetail.aspx?ProductId=" + productId.ToString());
                    }
                    break;

                case "addToCart":
                    {
                        //Response.Write("Ürününüz Sepete Eklenmiştir ...");

                        DropDownList drpStokAdedi = e.Item.FindControl("drpQuantity") as DropDownList;
                        
                        //buraya dönecegiz ...                        
                    }
                    break;
            }
        }

        // DropDownList'in içine Stok adetlerini (UnitsInStock) getirelim, eğer Stok = 0 ise "stokta yok" veya "tükendi" yazdıralım ...
        protected void DataList1_ItemCreated(object sender, DataListItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    Web.Library.Product prod = e.Item.DataItem as Web.Library.Product;

                    int? stok = prod.UnitsInStock; // stokta ürün kalmadığında -> "?" Nullable hata vermeyecek ...

                    DropDownList drpStokAdedi = e.Item.FindControl("drpQuantity") as DropDownList;

                    if (IsPostBack == true && drpStokAdedi.SelectedItem != null)
                    {
                        return;
                    }
                    if (stok == null || stok == 0)
                    {
                        ListItem li = new ListItem("Stokta Yok", "0");
                        drpStokAdedi.Items.Add(li);
                    }
                    else
                    {
                        for (int i = 0; i <= stok; i++)
                        {
                            drpStokAdedi.Items.Add(i.ToString());
                        }
                    }
                }
            }
            catch
            {

            }
        }
    }
}