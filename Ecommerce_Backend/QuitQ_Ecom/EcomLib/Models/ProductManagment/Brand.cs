using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models.ProductManagment
{
    public class Brand
    {
        public int BrandId { get; set; }
        public string BrandName { get; set; }
        public string Description { get; set; }
        public string LogoUrl { get; set; }
        public ICollection<Product> Products { get; set; }
    }

}
