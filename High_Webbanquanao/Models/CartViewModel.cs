using High_Webbanquanao.Data;

namespace High_Webbanquanao.Models
{
    public class CartViewModel
    {
        public High_Webbanquanao.Data.Cart Cart { get; set; }
        public string UserId { get; set; }
        public List<Product> Products { get; set; } // Add this property

        public High_Webbanquanao.Data.User User { get; set; }
        public High_Webbanquanao.Data.ProductCategory ProductCategory { get; set; }
        public High_Webbanquanao.Data.Product Product { get; set; }

    }
}
