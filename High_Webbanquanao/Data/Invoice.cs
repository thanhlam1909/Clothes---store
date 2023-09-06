using System;
using System.Collections.Generic;

namespace High_Webbanquanao.Data
{
    public partial class Invoice
    {
        public Invoice()
        {
            InvoiceDetails = new HashSet<InvoiceDetail>();
        }

        public int InvoiceId { get; set; }
        public string UserId { get; set; } = null!;
        public DateTime InvoiceDate { get; set; }
        public decimal TotalAmount { get; set; }
        public decimal ShippingFee { get; set; }
        public string PaymentMethod { get; set; } = null!;
        public string StatusOrder { get; set; } = null!;

        public virtual ICollection<InvoiceDetail> InvoiceDetails { get; set; }
    }
}
