/// <reference types="@angular/localize" />

// Angular Core & Bootstrap
import { bootstrapApplication } from '@angular/platform-browser';
import { importProvidersFrom } from '@angular/core';

// App root
import { AppComponent } from './app/app.component';
import { appRoutes } from './app/app.routes';

// Angular Routing & HTTP
import { provideRouter } from '@angular/router';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { HttpClientModule } from '@angular/common/http';

// Interceptors
import { authInterceptor } from './app/auth.interceptor';

// Forms & Animations
import { FormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

// Locale (Español)
import { registerLocaleData } from '@angular/common';
import localeEs from '@angular/common/locales/es';

registerLocaleData(localeEs);

bootstrapApplication(AppComponent, {
  providers: [
    provideHttpClient(withInterceptors([authInterceptor])),
    provideRouter(appRoutes),
    importProvidersFrom(
      HttpClientModule,
      FormsModule,
      BrowserAnimationsModule
    )
  ]
});
