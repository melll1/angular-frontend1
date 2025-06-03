import { ApplicationConfig, provideZoneChangeDetection } from '@angular/core';
import { importProvidersFrom } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { provideRouter } from '@angular/router';
import { appRoutes,  } from './app.routes';
import { HttpClientModule } from '@angular/common/http';


export const appConfig = {
  providers: [
    importProvidersFrom(BrowserModule,HttpClientModule),
    provideRouter(appRoutes)
  ]
};
