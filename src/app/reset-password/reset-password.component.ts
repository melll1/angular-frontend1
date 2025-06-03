// Importamos lo necesario para el componente standalone
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-reset-password',
  standalone: true, // Componente independiente sin necesidad de módulo
  imports: [CommonModule, FormsModule, RouterModule], // Módulos necesarios para ngModel y formularios
  templateUrl: './reset-password.component.html', // Plantilla HTML asociada
})
export class ResetPasswordComponent {
  // Campo para capturar el correo electrónico
  email = '';

  constructor(private http: HttpClient) {}

  // Función que se ejecuta al enviar el formulario
  onResetPassword() {
    // Validar que el email no esté vacío y tenga formato válido
    if (!this.email) {
      alert('⚠️ Debes ingresar un correo electrónico.');
      return;
    }

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(this.email)) {
      alert('⚠️ El formato del correo electrónico no es válido.');
      return;
    }

    const payload = {
      email: this.email
    };

    // Enviamos la solicitud POST al backend Laravel para iniciar el proceso de recuperación
    this.http.post('http://localhost:8000/api/forgot-password', payload).subscribe({
      next: (res: any) => {
        console.log('✅ Correo de recuperación enviado:', res);
        alert(res.message || '📧 Revisa tu correo para continuar.');
        // 🧹 Limpiar el formulario
      this.email = '';
      },
      error: (err) => {
        console.error('❌ Error al enviar el correo:', err);
        if (err.status === 422) {
          alert('❌ El correo ingresado no está registrado.');
        } else {
          alert('❌ Ocurrió un error al enviar el correo. Inténtalo más tarde.');
        }
      }
    });
  }
}
