import { Component, ViewEncapsulation } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule, ActivatedRoute, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class LoginComponent {
  email = '';
  password = '';
  errors: any = {};
  isVerifiedFromEmail = false;

  
  constructor(
    private authService: AuthService,
    private route: ActivatedRoute,
    private router: Router
  ) {
    this.route.queryParams.subscribe(params => {
      this.isVerifiedFromEmail = params['verified'] === '1';

      // Limpia el parámetro 'verified' de la URL para no mantenerlo
      if (this.isVerifiedFromEmail) {
        this.router.navigate([], {
          queryParams: {},
          replaceUrl: true
        });
      }
    });
  }

  onLogin() {
    this.errors = {};
 // 🔍 Validaciones básicas de email y contraseña
    if (!this.email) {
      this.errors.email = 'El email es obligatorio';
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.email)) {
      this.errors.email = 'Formato de email inválido';
    }

    if (!this.password) {
      this.errors.password = 'La contraseña es obligatoria';
    }

    if (Object.keys(this.errors).length > 0) return;

 // 🔐 Obtener cookie CSRF antes de autenticar
    this.authService.getCsrfCookie().subscribe({
      next: () => {
        // 🔑 Enviar credenciales al backend
        this.authService.login(
          { email: this.email, password: this.password },
          this.isVerifiedFromEmail
        ).subscribe({
          next: (res) => {
            console.log('✅ Login exitoso', res);
            alert('Bienvenido');
            localStorage.clear(); // 🔄 Borra entradas antiguas como "rol"

             // Guardar el token y el rol en localStorage
  localStorage.setItem('token', res.token);
  localStorage.setItem('role', res.user.role);
  localStorage.setItem('user_id', res.user.id); // en login.component.ts


            // 🧠 Obtener el perfil del usuario (para saber su rol)
          this.authService.obtenerPerfil().subscribe({
            next: (perfil) => {
              

              // 🚀 Redirigir al componente de perfiles (o donde corresponda)
              this.router.navigate(['/perfiles'], { state: { user: perfil } });
            },
            error: () => {
              alert('No se pudo obtener el perfil del usuario');
            }
          });
        },
          error: (err) => {
            console.error('❌ Error en login', err);
            if (err.status === 401) {
              alert('Credenciales inválidas');
            } else if (err.status === 403) {
              alert('Debes verificar tu correo antes de iniciar sesión.');
            } else if (err.status === 422) {
              this.errors = err.error.errors || {};
            } else {
              alert('Error inesperado al iniciar sesión.');
            }
          }
        });
      },
      error: (err) => {
        alert('Error obteniendo token CSRF');
        console.error(err);
      }
    });
  }
}
