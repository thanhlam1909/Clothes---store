using System.ComponentModel.DataAnnotations;

namespace High_Webbanquanao.Models
{
    public class LoginViewModel
    {
        public High_Webbanquanao.Data.User User { get; set; }
        public High_Webbanquanao.Data.ProductCategory ProductCategory { get; set; }
        public High_Webbanquanao.Data.Product Product { get; set; }
        public List<High_Webbanquanao.Data.Product> LatestProducts { get; set; }
        [Display(Name = "Remember me")]
        public bool RememberMe { get; set; }
    }
}
