
using EcomLib.Models.OrderManagement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models
{
    public class Payment
    {
        public int PaymentId { get; set; } // Primary Key
        public int OrderId { get; set; } // Foreign Key from Order
        public DateTime PaymentDate { get; set; }
        public decimal PaymentAmount { get; set; }
        public PaymentMethod PaymentMethod { get; set; } // Enum: CreditCard, DebitCard, NetBanking, UPI, COD
        public PaymentStatus PaymentStatus { get; set; } // Enum: Pending, Completed, Failed

        // Navigation property
        public Order Order { get; set; }
    }

    // Enum for PaymentMethod
    public enum PaymentMethod
    {
        CreditCard,
        DebitCard,
        NetBanking,
        UPI,
        COD
    }

    // Enum for PaymentStatus
    public enum PaymentStatus
    {
        Pending,
        Completed,
        Failed
    }

}
