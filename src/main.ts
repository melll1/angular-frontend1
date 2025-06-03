// Punto de entrada de la aplicación Angular
import { bootstrapApplication } from '@angular/platform-browser'; // Función para iniciar la app sin NgModule
import { AppComponent } from './app/app.component'; // Componente raíz
import { appRoutes } from './app/app.routes'; // Rutas definidas en el archivo app.routes.ts

// Funciones necesarias para enrutamiento y servicios
import { provideRouter } from '@angular/router'; // Proveedor para manejar rutas
import { importProvidersFrom } from '@angular/core'; // Para importar módulos como FormsModule y HttpClientModule

// Módulos para formularios y peticiones HTTP
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations'; // (opcional, útil si luego usas Angular Material)

bootstrapApplication(AppComponent, {
  providers: [
    provideRouter(appRoutes), // Registramos las rutas de la app
    importProvidersFrom(FormsModule, HttpClientModule, BrowserAnimationsModule), // Habilitamos formularios y HTTP
  ],
});
