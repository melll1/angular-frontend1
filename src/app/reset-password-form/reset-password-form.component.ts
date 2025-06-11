import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { RouterModule, ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-reset-password-form',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterModule],
  templateUrl: './reset-password-form.component.html',
  styleUrls: ['./reset-password-form.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class ResetPasswordFormComponent implements OnInit {
  token = '';
  email = '';
  password = '';
  password_confirmation = '';

  constructor(
    private http: HttpClient,
    private route: ActivatedRoute // Para leer query params
  ) {}

  ngOnInit(): void {
    // Extrae token y email de la URL si existen
    this.route.queryParams.subscribe(params => {
      if (params['token']) {
        this.token = params['token'];
      }
      if (params['email']) {
        this.email = params['email'];
      }
    });
  }

  onResetPassword() {
    if (!this.token || !this.email || !this.password || !this.password_confirmation) {
      alert('⚠️ Todos los campos son obligatorios.');
      return;
    }

    const payload = {
      token: this.token,
      email: this.email,
      password: this.password,
      password_confirmation: this.password_confirmation
    };

    this.http.post('http://localhost:8000/api/reset-password', payload).subscribe({
      next: (res) => {
        alert('✅ Contraseña restablecida con éxito');
         // Redirigir al login
      window.location.href = '/login'; // o con Angular Router:
      // this.router.navigate(['/login']);
      },
      error: (err) => {
        console.error('❌ Error al restablecer contraseña', err);
        alert('❌ Error al restablecer la contraseña');
      }
    });
  }
}
