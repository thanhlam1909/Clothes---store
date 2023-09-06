using System;
using System.Collections.Generic;

namespace High_Webbanquanao.Data
{
    public partial class InvoiceDetail
    {
        public int InvoiceDetailId { get; set; }
        public int InvoiceId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }

        public virtual Invoice Invoice { get; set; } = null!;
    }
}
