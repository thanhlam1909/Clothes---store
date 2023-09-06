namespace High_Webbanquanao.Models
{
    public class Thanhtoan
    {
        public High_Webbanquanao.Data.User User { get; set; }
        public High_Webbanquanao.Data.Product Product { get; set; }

        public High_Webbanquanao.Data.CartDetail CartDetail { get; set; }
        public High_Webbanquanao.Data.Cart Cart { get; set; }

        public decimal totalamount { get; set; }
        public decimal TotalPayment { get; set; }

        public decimal ShippingFee { get; set; }
        public string PaymentMethod { get; set; }


    }
}
