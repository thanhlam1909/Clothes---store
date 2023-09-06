namespace High_Webbanquanao.Models
{
    public class Index_Admin
    {
        public High_Webbanquanao.Data.Invoice Invoice { get; set; }
        public List<High_Webbanquanao.Data.Invoice> Invoices { get; set; }

        public High_Webbanquanao.Data.Product Product { get; set; }
        public High_Webbanquanao.Data.User User { get; set; }
        public High_Webbanquanao.Data.ProductCategory ProductCategory { get; set; }
        public List<High_Webbanquanao.Data.Product> Products { get; set; }
        public List<High_Webbanquanao.Data.User> Users { get; set; }
        public List<High_Webbanquanao.Data.ProductCategory> ProductCategories { get; set; }
        public int UserCount { get; set; }
        public int ProductCount { get; set; }
    }
}
