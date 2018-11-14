using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Library.Cart // Sepet
{
    public class CartTools
    {
        #region Sepete Ekle / Sil / Listele Metotlarım ...
        // Sepetteki Ürünleri Getir Metodum ...
        public static List<CartProduct> GetAllCartProduct(object value)
        {
            if (value == null) // sepette seçili bir ürün yoksa ...
            {
                return new List<CartProduct>();
            }
            else // sepette seçili ürün varsa ... 
            {
                return (List<CartProduct>)value;
            }
        }

        // Sepete Ekle Metodum ...
        public static List<CartProduct> AddItem(CartProduct newItem, object value)
        {
            List<CartProduct> currentItems = GetAllCartProduct(value);

            currentItems.Add(newItem);

            return currentItems;
        }

        // Sepetten Sil Metodum ...
        public static List<CartProduct> RemoveItem(CartProduct newItem, object value)
        {
            List<CartProduct> currentItems = GetAllCartProduct(value);

            currentItems.Remove(newItem);

            return currentItems;
        }
        #endregion

        // ---------------------------------------

        #region Sepete Eklenen Ürün Sayısı ve Total Fiyat Metotlarım ...

        // Sepetteki Toplam Ürün Adedi Metodum ...
        public static int? TotalProductCount(object value)
        {
            List<CartProduct> currentItems = GetAllCartProduct(value);

            int? result = null;

            foreach (CartProduct cur in currentItems)
            {
                result += (cur.Quantity); // adet olayımız olsun ...
            }
            return result;
        }

        // Sepetteki Toplam Ürün Fiyatı Metodum ...
        public static decimal? TotalProductPrice(object value)
        {
            List<CartProduct> currentItems = GetAllCartProduct(value);

            decimal? result = null;

            foreach (CartProduct cur in currentItems)
            {
                result += (cur.Quantity * cur.UnitPrice); // adet * fiyat olayımız ... 
            }
            return result;
        }
        #endregion
    }
}
