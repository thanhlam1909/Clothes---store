using System;
using System.Collections.Generic;

namespace High_Webbanquanao.Data
{
    public partial class PromotionTitle
    {
        public int PromotionTitleId { get; set; }
        public string Title { get; set; } = null!;
        public string? Description { get; set; }
        public int? PromotionProgramId { get; set; }

        public virtual PromotionProgram? PromotionProgram { get; set; }
    }
}
