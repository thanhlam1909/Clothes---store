using System;
using System.Collections.Generic;

namespace High_Webbanquanao.Data
{
    public partial class Review
    {
        public int ReviewId { get; set; }
        public int? ProductId { get; set; }
        public string? UserId { get; set; }
        public string ReviewText { get; set; } = null!;
        public int Rating { get; set; }
        public string Email { get; set; } = null!;
        public DateTime CreatedAt { get; set; }

        public virtual Product? Product { get; set; }
    }
}
