using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcomLib.Exceptionhandling
{
    public class CannotRetrieveRecordException : Exception
    {
        public CannotRetrieveRecordException(string message) : base(message) { }
    }
    public class InvalidInputException : Exception
    {
        public InvalidInputException(string message) : base(message) { }
    }
    public class UserNotFoundException : Exception
    {
        public UserNotFoundException(string message) : base(message) { }
    }
    public class ProductNotFoundException : Exception
    {
        public ProductNotFoundException(string message) : base(message) { }
    }

    public class ItemAlreadyExistsException : Exception
    {
        public ItemAlreadyExistsException(string message) : base(message) { }
    }
    public class CategoryNotFoundException : Exception
    {
        public CategoryNotFoundException(string message) : base(message) { }
    }
    public class BrandNotFoundException : Exception
    {
        public BrandNotFoundException(string message) : base(message) { }
    }

    public class InventoryNotFoundException : Exception
    {
        public InventoryNotFoundException(string message) : base(message) { }
    }
    public class CartNotFoundException : Exception
    {
        public CartNotFoundException(string message) : base(message) { }
    }

    public class CartItemNotFoundException : Exception
    {
        public CartItemNotFoundException(string message) : base(message) { }
    }

    public class CartOperationException : Exception
    {
        public CartOperationException(string message) : base(message) { }
    }
    public class DiscountNotFoundException : Exception
    {
        public DiscountNotFoundException(string message) : base(message) { }
    }
    public class ProductDiscountNotFoundException : Exception
    {
        public ProductDiscountNotFoundException(string message) : base(message) { }
    }
    public class ReviewNotFoundException : Exception
    {
        public ReviewNotFoundException(string message) : base(message) { }
    }
    public class DataAccessException : Exception
    {
        public DataAccessException(string message) : base(message) { }
    }
    // Exceptions/OrderNotFoundException.cs
    public class OrderNotFoundException : Exception
    {
        public OrderNotFoundException(int orderId)
            : base($"Order with ID {orderId} not found.")
        {
        }
    }

    // Exceptions/OrderItemNotFoundException.cs
    public class OrderItemNotFoundException : Exception
    {
        public OrderItemNotFoundException(int orderItemId)
            : base($"Order item with ID {orderItemId} not found.")
        {
        }
    }

}
