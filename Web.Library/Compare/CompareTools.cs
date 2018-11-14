using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Library.Compare // Karşılaştırma ...
{
    public class CompareTools
    {
        // Karşılaştırılacak Ürünleri Getir Metodum ...
        public static List<Product> GetComparables(object value)
        {
            if (value == null) // Karşılaştırılacak Ürün Yoksa ...
            {
                return new List<Product>();
            }
            else // Karşılaştırılacak Ürün Varsa ...
            {
                return (List<Product>)value;
            }
        }

        // Karşılaştırılacak Ürün -> Ekle Metodum ...
        public static List<Product> AddCompare(object destinationArea, Product addItem)
        {
            List<Product> currentItems = null;

            if (destinationArea == null) // Karşılaştırılacak bir alanım yoksa ...
            {
                currentItems = new List<Product>();
            }
            else // Karşılaştırılacak alanımda ürün varsa ...
            {
                currentItems = (List<Product>)destinationArea;
            }
            currentItems.Add(addItem);
            return currentItems;
        }

        // Karşılaştırılacak Ürün -> Silme Metodum ...
        public static List<Product> RemoveCompare(object destinationArea, Product removeItem)
        {
            List<Product> currentItems = null;

            if (destinationArea == null) 
            {
                currentItems = null;
            }
            else 
            {
                currentItems = (List<Product>)destinationArea;
            }
            currentItems.Remove(removeItem);
            return currentItems;
        }
    }
}
