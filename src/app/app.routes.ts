import { Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';/** Agregado para http://localhost:4200/login */
import { RegisterComponent } from './register/register.component';/**  Agregado para http://localhost:4200/register */
import { ResetPasswordComponent } from './reset-password/reset-password.component';/** Agregado para http://localhost:4200/reset-password */
import { ResetPasswordFormComponent } from './reset-password-form/reset-password-form.component';
import { PerfilesComponent } from './perfiles/perfiles.component';
import { HistorialMedicoComponent } from './historial-medico/historial-medico.component';
import { VacunasComponent } from './vacunas/vacunas.component';
import { DesparasitacionesComponent } from './desparasitaciones/desparasitaciones.component';
import { DiagnosticosComponent } from './components/diagnosticos.component';


export const appRoutes: Routes = [
  
  { path: '', redirectTo: 'login', pathMatch: 'full' },// Redirige desde la raíz al login
  { path: 'login', component: LoginComponent },/**Agregado para http://localhost:4200/login */
  { path: 'register', component: RegisterComponent },/** Agregado para http://localhost:4200/register */
  { path: 'reset-password', component: ResetPasswordComponent },/** Agregado para http://localhost:4200/reset-password */
  { path: 'reset-password-form', component: ResetPasswordFormComponent },/** Agregado para http://localhost:4200/reset-password-form */
  { path: 'pruebas', loadComponent: () => import('./pruebas/pruebas.component').then(m => m.PruebasComponent) },/** Agregado para http://localhost:4200/pruebas */
  { path: 'perfiles', loadComponent: () => import('./perfiles/perfiles.component').then(m => m.PerfilesComponent) },/** Agregado para http://localhost:4200/perfiles */
  { path: 'registro-mascota', loadComponent: () => import('./components/registro-mascota/registro-mascota.component').then(m => m.RegistroMascotaComponent) },/** Agregado para http://localhost:4200/registro-mascota */
  { path: 'lista-mascotas', loadComponent: () => import('./components/lista-mascotas/lista-mascotas.component').then(m => m.ListaMascotasComponent) },/** Agregado para http://localhost:4200/lista-mascotas */
 {
  path: 'historial-medico',
  loadComponent: () => import('./historial-medico/historial-medico.component').then(m => m.HistorialMedicoComponent)
},
{
  path: 'historial-medico/:id',
  loadComponent: () => import('./historial-medico/historial-medico.component').then(m => m.HistorialMedicoComponent)
},



{ path: 'vacunas', loadComponent: () => import('./vacunas/vacunas.component').then(m => m.VacunasComponent) },/** Agregado para http://localhost:4200/vacunas */

{ path: 'desparasitaciones', loadComponent: () => import('./desparasitaciones/desparasitaciones.component').then(m => m.DesparasitacionesComponent) },/** Agregado para http://localhost:4200/desparasitaciones */

{ path: 'tratamientos', loadComponent: () => import('./components/tratamientos/tratamientos.component').then(m => m.TratamientosComponent) },

{ path: 'diagnosticos', loadComponent: () => import ('./components/tratamientos/tratamientos.component').then(m => m.TratamientosComponent)},


];