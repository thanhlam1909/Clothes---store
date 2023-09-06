using System;
using System.Collections.Generic;

namespace High_Webbanquanao.Data
{
    public partial class PromotionCode
    {
        public int PromotionCodeId { get; set; }
        public string Code { get; set; } = null!;
        public decimal Discount { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
    }
}
