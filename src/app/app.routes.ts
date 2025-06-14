import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { ResetPasswordComponent } from './reset-password/reset-password.component';
import { ResetPasswordFormComponent } from './reset-password-form/reset-password-form.component';
import { NotfoundComponent } from './notfound/notfound.component';
import { AuthGuard } from './guards/auth.guard';
import { RestringidoComponent } from './restringido/restringido.component';

export const appRoutes: Routes = [
  { path: '', redirectTo: 'login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'reset-password', component: ResetPasswordComponent },
  { path: 'reset-password-form', component: ResetPasswordFormComponent },
  { path: 'notfound', component: NotfoundComponent},
  { path: 'restringido', component: RestringidoComponent},

  {
    path: '',
    loadComponent: () => import('./components/layout/layout.component').then(m => m.LayoutComponent),
    children: [
      { path: 'perfiles', loadComponent: () => import('./perfiles/perfiles.component').then(m => m.PerfilesComponent),
        canActivate: [AuthGuard],
        data: { roles: ['veterinario' , 'dueno' , 'paseador']}
       },
      { path: 'registro-mascota', loadComponent: () => import('./components/registro-mascota/registro-mascota.component').then(m => m.RegistroMascotaComponent),
        canActivate: [AuthGuard],
        data: { roles: ['veterinario']}
       },
      { path: 'lista-mascotas', loadComponent: () => import('./components/lista-mascotas/lista-mascotas.component').then(m => m.ListaMascotasComponent),
        canActivate: [AuthGuard],
        data: { roles: ['veterinario' , 'dueno']}
       },
      { path: 'historial-medico', loadComponent: () => import('./components/historial-medico/historial-medico.component').then(m => m.HistorialMedicoComponent),
        canActivate: [AuthGuard],
        data: { roles: ['veterinario' , 'dueno']}
       },
      { path: 'historial-medico/:id', loadComponent: () => import('./components/historial-medico/historial-medico.component').then(m => m.HistorialMedicoComponent)},

      { path: 'vacunas', loadComponent: () => import('./components/vacunas/vacunas.component').then(m => m.VacunasComponent),
        canActivate: [AuthGuard],
        data: { roles: ['veterinario']}
       },
      { path: 'desparasitaciones', loadComponent: () => import('./components/desparasitaciones/desparasitaciones.component').then(m => m.DesparasitacionesComponent),
        canActivate: [AuthGuard],
        data: { roles: ['veterinario']}
       },
      { path: 'tratamientos', loadComponent: () => import('./components/tratamientos/tratamientos.component').then(m => m.TratamientosComponent),
        canActivate: [AuthGuard],
        data: { roles: ['veterinario' , 'dueno']}
       },
      { path: 'diagnosticos', loadComponent: () => import('./components/diagnosticos/diagnosticos.component').then(m => m.DiagnosticosComponent),
        canActivate: [AuthGuard],
        data: { roles: ['veterinario']}
       },
      { path: 'notificaciones', loadComponent: () => import('./components/notificaciones/notificaciones.component').then(m => m.NotificacionesComponent) },
<<<<<<< Updated upstream
      { path: 'calendario', loadComponent: () => import('./calendario/calendario.component').then(m => m.CalendarioComponent) },
      { path: 'mensajeria/:mascotaId/:receptorId', loadComponent: () => import('./components/mensajeria/mensajeria.component').then(m => m.MensajeriaComponent) },
      { path: 'bandeja-mensajes', loadComponent: () => import('./components/bandeja-mensajes/bandeja-mensajes.component').then(m => m.BandejaMensajesComponent) },

=======
      { path: 'calendario', loadComponent: () => import('./calendario/calendario.component').then(m => m.CalendarioComponent),
        canActivate: [AuthGuard],
        data: { roles: ['veterinario' , 'dueno' , 'paseador']}
       },
     
>>>>>>> Stashed changes
    ]
  }
];
