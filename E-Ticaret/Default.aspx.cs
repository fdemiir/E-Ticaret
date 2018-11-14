using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Ticaret
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) // == true            
                return;
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
    }
}