import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { ResetPasswordComponent } from './reset-password/reset-password.component';
import { ResetPasswordFormComponent } from './reset-password-form/reset-password-form.component';

export const appRoutes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'reset-password', component: ResetPasswordComponent },
  { path: 'reset-password-form', component: ResetPasswordFormComponent },

  {
    path: '',
    loadComponent: () => import('./components/layout/layout.component').then(m => m.LayoutComponent),
    children: [
      { path: 'perfiles', loadComponent: () => import('./perfiles/perfiles.component').then(m => m.PerfilesComponent) },
      { path: 'registro-mascota', loadComponent: () => import('./components/registro-mascota/registro-mascota.component').then(m => m.RegistroMascotaComponent) },
      { path: 'lista-mascotas', loadComponent: () => import('./components/lista-mascotas/lista-mascotas.component').then(m => m.ListaMascotasComponent) },
      { path: 'historial-medico', loadComponent: () => import('./components/historial-medico/historial-medico.component').then(m => m.HistorialMedicoComponent) },
      { path: 'historial-medico/:id', loadComponent: () => import('./components/historial-medico/historial-medico.component').then(m => m.HistorialMedicoComponent) },
      { path: 'vacunas', loadComponent: () => import('./components/vacunas/vacunas.component').then(m => m.VacunasComponent) },
      { path: 'desparasitaciones', loadComponent: () => import('./components/desparasitaciones/desparasitaciones.component').then(m => m.DesparasitacionesComponent) },
      { path: 'tratamientos', loadComponent: () => import('./components/tratamientos/tratamientos.component').then(m => m.TratamientosComponent) },
      { path: 'diagnosticos', loadComponent: () => import('./components/diagnosticos/diagnosticos.component').then(m => m.DiagnosticosComponent) },
      { path: 'notificaciones', loadComponent: () => import('./components/notificaciones/notificaciones.component').then(m => m.NotificacionesComponent) },
      { path: 'calendario', loadComponent: () => import('./calendario/calendario.component').then(m => m.CalendarioComponent) },
    ]
  }
];
