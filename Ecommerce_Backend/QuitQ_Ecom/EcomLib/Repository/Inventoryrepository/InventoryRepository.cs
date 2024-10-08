
using EcomLib.Exceptionhandling;
using EcomLib.Models;
using EcomQuitQ.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Repository.Inventoryrepository
{
    public class InventoryRepository : IInventoryRepository
    {
        private readonly AppDbContext _context;

        public InventoryRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Inventory>> GetAllInventoriesAsync()
        {
            return await _context.Inventories
                                 .Include(i => i.Product)
                                 .ToListAsync();
        }

        public async Task<Inventory> GetInventoryByIdAsync(int inventoryId)
        {
            var inventory = await _context.Inventories
                                          .Include(i => i.Product)
                                          .FirstOrDefaultAsync(i => i.InventoryId == inventoryId);

            if (inventory == null)
            {
                throw new InventoryNotFoundException("No Inveto");
            }

            return inventory;
        }

        public async Task<IEnumerable<Inventory>> GetInventoriesByProductIdAsync(int productId)
        {
            var inventories = await _context.Inventories
                                            .Include(i => i.Product)
                                            .Where(i => i.ProductId == productId)
                                            .ToListAsync();

            if (!inventories.Any())
            {
                throw new InventoryNotFoundException($"ProductId: {productId}");
            }

            return inventories;
        }

        public async Task<IEnumerable<Inventory>> GetInventoriesByProductNameAsync(string productName)
        {
            var inventories = await _context.Inventories
                                            .Include(i => i.Product)
                                            .Where(i => i.Product.ProductName.Contains(productName))
                                            .ToListAsync();

            if (!inventories.Any())
            {
                throw new InventoryNotFoundException(productName);
            }

            return inventories;
        }
    }
}
