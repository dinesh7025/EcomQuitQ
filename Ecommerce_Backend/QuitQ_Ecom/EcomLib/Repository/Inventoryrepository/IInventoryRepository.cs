using EcomLib.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.Inventoryrepository
{
    public interface IInventoryRepository
    {
        Task<IEnumerable<Inventory>> GetAllInventoriesAsync();
        Task<Inventory> GetInventoryByIdAsync(int inventoryId);
        Task<IEnumerable<Inventory>> GetInventoriesByProductIdAsync(int productId);
        Task<IEnumerable<Inventory>> GetInventoriesByProductNameAsync(string productName);
    }
}
