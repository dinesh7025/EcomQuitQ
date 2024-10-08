using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Models.ProductManagment
{
    public class SubCategory
    {
        public int SubCategoryId { get; set; }
        public int ParentCategoryId { get; set; }
        public string SubCategoryName { get; set; }
        public string Description { get; set; }
        public ParentCategory ParentCategory { get; set; }
        public ICollection<Product> Products { get; set; }
    }

}
