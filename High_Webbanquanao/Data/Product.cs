using System;
using System.Collections.Generic;

namespace High_Webbanquanao.Data
{
    public partial class Product
    {
        public Product()
        {
            CartDetails = new HashSet<CartDetail>();
            FavoriteProducts = new HashSet<FavoriteProduct>();
            Reviews = new HashSet<Review>();
            Categories = new HashSet<ProductCategory>();
        }

        public int ProductId { get; set; }
        public string ProductName { get; set; } = null!;
        public string? Description { get; set; }
        public string ProductImage { get; set; } = null!;
        public decimal Price { get; set; }
        public int StockQuantity { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Material { get; set; } = null!;
        public string Size { get; set; } = null!;
        public string Color { get; set; } = null!;

        public virtual ICollection<CartDetail> CartDetails { get; set; }
        public virtual ICollection<FavoriteProduct> FavoriteProducts { get; set; }
        public virtual ICollection<Review> Reviews { get; set; }

        public virtual ICollection<ProductCategory> Categories { get; set; }
    }
}
