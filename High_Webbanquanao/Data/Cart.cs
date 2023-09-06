using System;
using System.Collections.Generic;

namespace High_Webbanquanao.Data
{
    public partial class Cart
    {
        public Cart()
        {
            CartDetails = new HashSet<CartDetail>();
        }

        public int CartId { get; set; }
        public string? UserId { get; set; }
        public DateTime? CreatedDate { get; set; }

        public virtual User? User { get; set; }
        public virtual ICollection<CartDetail> CartDetails { get; set; }
    }
}
