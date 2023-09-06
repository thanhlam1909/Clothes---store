namespace High_Webbanquanao.Models
{
    public class ProductListModel
    {

        public List<High_Webbanquanao.Data.Product> Productlist { get; set; }
        public int CurrentPage { get; set; }
        public int TotalPages { get; set; }
    }
}
