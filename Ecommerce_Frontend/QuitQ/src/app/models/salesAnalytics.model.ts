export interface SalesByCategory {
    categoryName: string;
    totalSales: number;
  }
  export interface SalesByProduct {
    productName: string;
    totalSales: number;
  }
  export interface SalesBySeller {
    sellerName: string;
    totalSales: number;
  }
  export interface DailySales {
    date: Date; 
    totalSales: number;
  }
  export interface TopSellingProduct {
    productName: string;
    totalSales: number;
  }
        