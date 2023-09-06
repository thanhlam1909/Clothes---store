namespace High_Webbanquanao.Models
{
    public class MyAccountViewModel
    {
        public High_Webbanquanao.Data.User User { get; set; }
        public High_Webbanquanao.Data.Product Product { get; set; }
        public List<High_Webbanquanao.Data.Invoice> Invoices { get; set; }
        public List<High_Webbanquanao.Data.Product> Products { get; set; }

        public string UserId { get; set; }
    }
}
