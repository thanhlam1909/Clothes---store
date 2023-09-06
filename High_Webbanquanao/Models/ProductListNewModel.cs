namespace High_Webbanquanao.Models
{
    public class ProductListNewModel
    {
        public List<High_Webbanquanao.Data.Product> LatestProducts { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }
    }
}
