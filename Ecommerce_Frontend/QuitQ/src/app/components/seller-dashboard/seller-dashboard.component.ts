import { Component, OnInit } from '@angular/core';
import { SellerService } from '../../services/seller.service';
import { SalesAnalyticsService } from '../../services/sales-analytics.service';
import { AuthService } from '../../services/auth-service.service';
import { AdminFooterComponent } from '../admin-footer/admin-footer.component';
import { SellerHeaderComponent } from '../seller-header/seller-header.component';
import { CommonModule } from '@angular/common';
import { Chart, registerables } from 'chart.js';
Chart.register(...registerables);

@Component({
  selector: 'app-seller-dashboard',
  standalone: true,
  imports: [AdminFooterComponent, SellerHeaderComponent, CommonModule],
  templateUrl: './seller-dashboard.component.html',
  styleUrls: ['./seller-dashboard.component.css']
})
export class SellerDashboardComponent implements OnInit {

  salesByProductChart: Chart | undefined;
  salesByMonthChart: Chart | undefined;
  sellerRevenue: number = 0;
  topSellingProduct: any;

  constructor(
    private sellerService: SellerService,
    private salesService: SalesAnalyticsService,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    const userId = this.authService.getUserIdFromToken()!;
    this.fetchSellerDetails(userId);
  }

  fetchSellerDetails(userId: number): void {
    this.sellerService.getSellerDetails(userId).subscribe({
      next: (details) => {
        this.loadSalesByProduct(details.sellerId);
        this.loadSalesByMonth(details.sellerId);
        this.loadTopSellingProduct(details.sellerId);
        this.loadSellerRevenue(details.sellerId);
      },
      error: (error) => {
        console.error('Error fetching seller details:', error);
      }
    });
  }

  loadSalesByProduct(sellerId: number) {
    this.salesService.getSalesByProductofSeller(sellerId).subscribe(data => {
      const productNames = data.map((item: { productName: any; }) => item.productName);  
      const salesAmounts = data.map((item: { totalSalesAmount: any; }) => item.totalSalesAmount);

      const ctx = document.getElementById('salesByProductChart') as HTMLCanvasElement;
      this.salesByProductChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: productNames,
          datasets: [{
            label: 'Sales by Product',
            data: salesAmounts,
            backgroundColor: 'rgba(54, 162, 235, 0.5)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1
          }]
        },
        options: {
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });
    });
  }

  loadSalesByMonth(sellerId: number) {
    this.salesService.getSalesByMonth(sellerId).subscribe(data => {
      const months = data.map((item: { month: number; year: number; }) => `${item.month}/${item.year}`);  
      const salesAmounts = data.map((item: { totalSalesAmount: any; }) => item.totalSalesAmount);

      const ctx = document.getElementById('salesByMonthChart') as HTMLCanvasElement;
      this.salesByMonthChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: months,
          datasets: [{
            label: 'Sales by Month',
            data: salesAmounts,
            backgroundColor: 'rgba(255, 99, 132, 0.5)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1,
            fill: true
          }]
        },
        options: {
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });
    });
  }

  loadTopSellingProduct(sellerId: number) {
    this.salesService.getTopSellingProduct(sellerId).subscribe(data => {
      this.topSellingProduct = data;
    });
  }

  loadSellerRevenue(sellerId: number) {
    this.salesService.getRevenueBySeller(sellerId).subscribe(data => {
      this.sellerRevenue = data.totalRevenue;
    });
  }
}
