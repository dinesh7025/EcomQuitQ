import { Routes } from '@angular/router';
import { SignInComponent } from './components/sign-in/sign-in.component';
import { SignUpComponent } from './components/sign-up/sign-up.component';
import { HomeComponent } from './components/home/home.component'; 
import { LandingPageComponent } from './components/landing-page/landing-page.component';
import { CartComponent } from './components/cart/cart.component';
import { SellerSignupComponent } from './components/seller-signup/seller-signup.component';
import { AdminDashboardComponent } from './components/admin-dashboard/admin-dashboard.component';
import { ManageProductComponent } from './components/manage-products/manage-products.component';
import { UserProfileComponent } from './components/user-profile/user-profile.component';
import { ManageUsersComponent } from './components/manage-users/manage-users.component';
import { ManageCategoriesComponent } from './components/manage-categories/manage-categories.component';
import { ManageOrdersComponent } from './components/manage-orders/manage-orders.component';
import { ManageProductsSellerComponent } from './components/manage-products-seller/manage-products-seller.component';
import { ManageOrderSellerComponent } from './components/manage-order-seller/manage-order-seller.component';
import { SellerDashboardComponent } from './components/seller-dashboard/seller-dashboard.component';
import { ProductDetailsComponent } from './components/product-details/product-details.component';
import { HeaderComponent } from './components/header/header.component';
import { WishlistComponent } from './components/wish-list/wish-list.component';
import { AuthGuard } from './Guards/auth-guard.guard';
import { UserOrderComponent } from './components/user-order/user-order.component';



export const routes: Routes = [
    {
        path: 'login',
        component: SignInComponent
    },
    {
        path: 'register',
        component: SignUpComponent
    },
    {
        path: 'cart',
        component: CartComponent,
        canActivate:[AuthGuard]
    },
    {
        path: '',
        component:HomeComponent

    },
    {
        path: 'seller-signup',
        component: SellerSignupComponent
    },
    {
        path: 'admin',
        component: AdminDashboardComponent,
        canActivate:[AuthGuard]
    },
    {
        path: 'manage-products',
        component: ManageProductComponent,
        canActivate:[AuthGuard]
    },
    {
        path:'user-profile',
        component: UserProfileComponent,
        canActivate:[AuthGuard]
    },
    {
        path: 'manage-users',
        component:ManageUsersComponent,
        canActivate:[AuthGuard]
    },
    {
        path: 'manage-categories',
        component: ManageCategoriesComponent,
        canActivate:[AuthGuard]
    },
    {
        path:'manage-orders',
        component:ManageOrdersComponent,
        canActivate:[AuthGuard]
    },
    {
        path: 'manage-product-seller',
        component: ManageProductsSellerComponent,
        canActivate:[AuthGuard]
    },
    {
        path: 'manage-order-seller',
        component:ManageOrderSellerComponent,
        canActivate:[AuthGuard]
    },
    {
        path: 'seller-dashboard',
        component:SellerDashboardComponent,
        canActivate:[AuthGuard]
    },
    {
        path:'product-details/:id',
        component:ProductDetailsComponent
    },
    {
        path: 'header',
        component:HeaderComponent
    },
    {
        path: 'wish-list',
        component: WishlistComponent,
        canActivate:[AuthGuard]
    },
    {
        path: 'user-order-history',
        component:UserOrderComponent,
        canActivate: [AuthGuard]
    }
];
