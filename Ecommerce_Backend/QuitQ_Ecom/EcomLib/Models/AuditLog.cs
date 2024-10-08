using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models
{
    public class AuditLog
    {
        public int LogId { get; set; }  // Primary Key
        public int UserId { get; set; }
        public string Action { get; set; }
        public string TableAffected { get; set; }
        public int RecordId { get; set; }
        public DateTime Timestamp { get; set; }
        public string Details { get; set; }

    }
}
