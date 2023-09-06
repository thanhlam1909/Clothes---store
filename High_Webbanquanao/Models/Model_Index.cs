namespace High_Webbanquanao.Models
{
    public class Model_Index
    {
        public High_Webbanquanao.Data.Cart Cart { get; set; }

        public High_Webbanquanao.Data.User User { get; set; }
        public High_Webbanquanao.Data.ProductCategory ProductCategory { get; set; }
        public High_Webbanquanao.Data.Product Product { get; set; }
        public List<High_Webbanquanao.Data.Product> LatestProducts { get; set; }

    }
}
