import { ApplicationConfig, provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';

import { routes } from './app.routes';
import { provideAnimationsAsync } from '@angular/platform-browser/animations/async';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { provideCharts, withDefaultRegisterables } from 'ng2-charts';
import { authInterceptor } from './interceptor/auth.interceptor';


export const appConfig: ApplicationConfig = {
  providers: [
          provideZoneChangeDetection({ eventCoalescing: true }), 
          provideRouter(routes), provideAnimationsAsync(),
          provideHttpClient(),
          provideCharts(withDefaultRegisterables()), 
          provideAnimationsAsync(),
          provideHttpClient(withInterceptors([authInterceptor]))
        ]
};
