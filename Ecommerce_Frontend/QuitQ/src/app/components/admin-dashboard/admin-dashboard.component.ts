import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { SalesAnalyticsService } from '../../services/sales-analytics.service';
import { SalesByCategory,SalesByProduct,DailySales } from '../../models/salesAnalytics.model';
import { AdminFooterComponent } from '../admin-footer/admin-footer.component';
import { AdminHeaderComponent } from '../admin-header/admin-header.component';
import { BaseChartDirective } from 'ng2-charts';
import { ChartData, ChartOptions } from 'chart.js';


@Component({
  selector: 'app-admin-dashboard',
  standalone: true,
  imports: [CommonModule,AdminFooterComponent,AdminHeaderComponent, BaseChartDirective],
  templateUrl: './admin-dashboard.component.html',
  styleUrls: ['./admin-dashboard.component.css'] // Fixed typo
})
export class AdminDashboardComponent implements OnInit {
  totalUsers: number = 0;
  totalSellers: number = 0;
  totalRevenue: number | null = null;

  recentActivities: any[] = []; 

 // Declare the chart data variables
 salesByCategoryChartData: ChartData<'bar'> = {
  labels: [],
  datasets: []
};

salesByProductChartData: ChartData<'bar'> = {
  labels: [],
  datasets: []
};

dailySalesChartData: ChartData<'line'> = {
  labels: [],
  datasets: []
};

// Chart options (optional and customizable)
chartOptions: ChartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  scales: {
    x: {},
    y: {
      beginAtZero: true
    }
  }
};


  constructor(private http: HttpClient, private salesAnalyticsService: SalesAnalyticsService) {}

  ngOnInit(): void {
    this.getRecentUsers(); 
    this.loadSalesByCategory();
    this.loadSalesByProduct();
    this.loadDailySales();
    this.loadTotalSellers();
    this.loadTotalUsers();  
    this.getTotalRevenue();
  }

  getRecentUsers(): void {
    const apiUrl = 'https://localhost:7264/api/Admin/user-last-month';
    
    this.http.get<any[]>(apiUrl).subscribe(
      (data) => {
        this.recentActivities = data.map(user => ({
          userId: user.userId,
          username: user.userName,
          activity: `Registered on ${new Date(user.dateCreated).toLocaleDateString()}`,
          isActive: user.isActive
        }));
      },
      (error) => {
        console.error('Error fetching recent users:', error);
      }
    );   
  }
   // Load sales by category data and bind to bar chart
   loadSalesByCategory() {
    this.salesAnalyticsService.getSalesByCategory().subscribe((data: SalesByCategory[]) => {
      this.salesByCategoryChartData.labels = data.map(item => item.categoryName);
      this.salesByCategoryChartData.datasets = [{
        label: 'Sales by Category',
        data: data.map(item => item.totalSales),
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
      }];
    });
  }

  // Load sales by product data and bind to pie chart
  loadSalesByProduct() {
    this.salesAnalyticsService.getSalesByProduct().subscribe((data: SalesByProduct[]) => {
      this.salesByProductChartData.labels = data.map(item => item.productName);
      this.salesByProductChartData.datasets = [{
        label: 'Sales by Product',
        data: data.map(item => item.totalSales),
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)'
        ],
        borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 1
      }];
    });
  }

  // Load daily sales data and bind to line chart
  loadDailySales() {
    this.salesAnalyticsService.getDailySales().subscribe((data: DailySales[]) => {
      this.dailySalesChartData.labels = data.map(item => item.date);
      this.dailySalesChartData.datasets = [{
        label: 'Daily Sales',
        data: data.map(item => item.totalSales),
        fill: false,
        borderColor: 'rgba(75, 192, 192, 1)',
        tension: 0.1
      }];
    });
  }
  loadTotalUsers(): void {
    this.salesAnalyticsService.getTotalUserRegistrations().subscribe(
      (count) => {
        this.totalUsers = count;
      },
      (error) => {
        console.error('Error fetching total users:', error);
      }
    );
  }

  loadTotalSellers(): void {
    this.salesAnalyticsService.getTotalSellerRegistrations().subscribe(
      (count) => {
        this.totalSellers = count;
      },
      (error) => {
        console.error('Error fetching total sellers:', error);
      }
    );
  }
  // Fetch overall revenue
  getTotalRevenue(): void {
    this.salesAnalyticsService.getTotalRevenue().subscribe(
      (data) => {
        this.totalRevenue = data.totalRevenue;
      },
      (error) => {
        console.error('Error fetching total revenue:', error);
      }
    );
  }
}
