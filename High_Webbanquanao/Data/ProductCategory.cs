using System;
using System.Collections.Generic;

namespace High_Webbanquanao.Data
{
    public partial class ProductCategory
    {
        public ProductCategory()
        {
            Products = new HashSet<Product>();
        }

        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = null!;
        public string Gender { get; set; } = null!;

        public virtual ICollection<Product> Products { get; set; }
    }
}
