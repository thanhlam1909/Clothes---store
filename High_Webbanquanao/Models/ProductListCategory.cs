namespace High_Webbanquanao.Models
{
    public class ProductListCategory
    {
        public High_Webbanquanao.Data.Product Product { get; set; }
        public High_Webbanquanao.Data.ProductCategory ProductCategory { get; set; }
        public List<High_Webbanquanao.Data.Product> Products { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }
    }

}
