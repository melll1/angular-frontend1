import { AfterViewInit, Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';  // Importa AuthService

declare const M: any;

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],
  templateUrl: './register.component.html',
})
export class RegisterComponent implements AfterViewInit {
  name = '';
  email = '';
  password = '';
  password_confirmation = '';
  telefono = '';
  role = '';
  errors: any = {};

  constructor(private authService: AuthService, private router: Router) {}

  ngAfterViewInit() {
    const elems = document.querySelectorAll('select');
    M.FormSelect.init(elems);
  }

  onRegister() {
    this.errors = {};

    if (!this.name) this.errors.name = 'El nombre es obligatorio';
    if (!this.email) this.errors.email = 'El correo es obligatorio';
    else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.email)) {
      this.errors.email = 'Formato de correo inválido';
    }
    if (!this.password) this.errors.password = 'La contraseña es obligatoria';
    else if (this.password.length < 6) {
      this.errors.password = 'Debe tener al menos 6 caracteres';
    }
    if (!this.password_confirmation) {
      this.errors.password_confirmation = 'La confirmación de contraseña es obligatoria';
    } else if (this.password !== this.password_confirmation) {
      this.errors.password_confirmation = 'Las contraseñas no coinciden';
    }
    if (!this.telefono) this.errors.telefono = 'El teléfono es obligatorio';
    else if (!/^[0-9]{7,15}$/.test(this.telefono)) {
      this.errors.telefono = 'Debe contener entre 7 y 15 dígitos';
    }
    if (!this.role) this.errors.role = 'El rol es obligatorio';

    if (Object.keys(this.errors).length > 0) return;

    const userData = {
      name: this.name,
      email: this.email,
      password: this.password,
      password_confirmation: this.password_confirmation,
      telefono: this.telefono,
      role: this.role,
    };

    // Paso 1: Obtener token CSRF
  this.authService.getCsrfCookie().subscribe({
    next: () => {
      // Paso 2: Registrar
      this.authService.register(userData).subscribe({
        next: (res) => {
          alert('✅ Usuario registrado correctamente. Revisa tu correo para verificar la cuenta.');
          // Limpiar campos del formulario
    this.name = '';
    this.email = '';
    this.password = '';
    this.password_confirmation = '';
    this.telefono = '';
    this.role = '';

    // Redirigir a /register
          this.router.navigate(['/register']);
        },
        error: (err) => {
          console.error('❌ Error en registro', err);
          if (err.status === 422 && err.error.errors) {
            this.errors = err.error.errors;
          } else {
            alert('⚠️ Error inesperado. Intenta más tarde.');
          }
        }
      });
    },
    error: () => {
      alert('⚠️ No se pudo conectar con el backend.');
    }
  });
}
}
