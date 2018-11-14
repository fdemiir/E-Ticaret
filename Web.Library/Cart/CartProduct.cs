using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Library.Cart // Sepet
{
    // Önce bu Classı tanımladık -> ardından "CartTools.cs" 'ye geçiyorum ...
    public class CartProduct // Sepetteki Ürün bilgilerimiz ...
    {
        // prop + tab + tab
        public Product SelectedProduct { get; set; }

        public int ProductId
        {
            get
            {
                return SelectedProduct.ProductID;
            }
        }

        public string ProductName
        {
            get
            {
                return SelectedProduct.ProductName;
            }
        }

        public decimal? UnitPrice // ? -> Nullable özelliği ile boş olma durumunu vb. aradan çıkardık (hata vermez !!!)
        {
            get
            {
                return SelectedProduct.UnitPrice;
            }
        }

        public int? UnitsInStock
        {
            get
            {
                return SelectedProduct.UnitsInStock;
            }
        }

        public string SmallPhotoPath
        {
            get
            {
                return SelectedProduct.SmallPhotoPath;
            }
        }

        public int Quantity { get; set; } // sepetteki adedi sayma olayımız olsun ...
    }
}
