using System;
using System.Collections.Generic;

namespace High_Webbanquanao.Data
{
    public partial class FavoriteProduct
    {
        public int FavoriteId { get; set; }
        public int? ProductId { get; set; }
        public string? UserId { get; set; }

        public virtual Product? Product { get; set; }
    }
}
