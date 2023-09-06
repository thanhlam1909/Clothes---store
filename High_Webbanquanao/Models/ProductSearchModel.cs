namespace High_Webbanquanao.Models
{
    public class ProductSearchModel
    {
        public High_Webbanquanao.Data.Product Product { get; set; }
        public string Query { get; set; }
        public List<High_Webbanquanao.Data.Product> SearchResults { get; set; }

        public int CurrentPage { get; set; }
        public int TotalSearchPages { get; set; }
    }
}
