using System;
using System.Collections.Generic;

namespace High_Webbanquanao.Data
{
    public partial class PromotionProgram
    {
        public PromotionProgram()
        {
            PromotionTitles = new HashSet<PromotionTitle>();
        }

        public int PromotionProgramId { get; set; }
        public string ProgramName { get; set; } = null!;
        public string? Description { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }

        public virtual ICollection<PromotionTitle> PromotionTitles { get; set; }
    }
}
