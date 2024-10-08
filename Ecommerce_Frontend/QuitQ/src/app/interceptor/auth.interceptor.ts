import { HttpInterceptorFn } from '@angular/common/http';
import { AuthService } from '../services/auth-service.service';
import { inject } from '@angular/core';

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  // Retrieve the token from your AuthService
  const authService = inject(AuthService)
  const token = authService.getToken(); 

  // If the token exists, clone the request and add the Authorization header
  if (token) {
    const clonedRequest = req.clone({
      setHeaders: {
        Authorization: `Bearer ${token}`
      }
    });

    // Pass the cloned request with the Authorization header
    return next(clonedRequest);
  }

  // If no token, pass the original request
  return next(req);
};
