using EcomLib.Dtos.ProductDtos;
using EcomLib.Models;
using EcomLib.Repository.Inventoryrepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Service
{
    public class InventoryService
    {
        private readonly IInventoryRepository _inventoryRepository;

        public InventoryService(IInventoryRepository inventoryRepository)
        {
            _inventoryRepository = inventoryRepository;
        }

        public async Task<IEnumerable<InventoryDTO>> GetAllInventoriesAsync()
        {
            var inventories = await _inventoryRepository.GetAllInventoriesAsync();
            return inventories.Select(i => MapToInventoryDTO(i));
        }

        public async Task<InventoryDTO> GetInventoryByIdAsync(int inventoryId)
        {
            var inventory = await _inventoryRepository.GetInventoryByIdAsync(inventoryId);
            return MapToInventoryDTO(inventory);
        }

        public async Task<IEnumerable<InventoryDTO>> GetInventoriesByProductIdAsync(int productId)
        {
            var inventories = await _inventoryRepository.GetInventoriesByProductIdAsync(productId);
            return inventories.Select(i => MapToInventoryDTO(i));
        }

        public async Task<IEnumerable<InventoryDTO>> GetInventoriesByProductNameAsync(string productName)
        {
            var inventories = await _inventoryRepository.GetInventoriesByProductNameAsync(productName);
            return inventories.Select(i => MapToInventoryDTO(i));
        }

        // Mapping function to convert Inventory to InventoryDTO
        private InventoryDTO MapToInventoryDTO(Inventory inventory)
        {
            return new InventoryDTO
            {
                InventoryId = inventory.InventoryId,
                ProductId = inventory.ProductId,
                QuantityInStock = inventory.QuantityInStock,
                ReorderLevel = inventory.ReorderLevel,
                LastRestockedDate = inventory.LastRestockedDate
            };
        }
    }

}
