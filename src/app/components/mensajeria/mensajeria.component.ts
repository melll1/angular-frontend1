import { Component, Input, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';

// ✅ Angular Material Modules
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatChipsModule } from '@angular/material/chips';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-mensajeria',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatChipsModule
  ],
  templateUrl: './mensajeria.component.html',
  styleUrls: ['./mensajeria.component.css']
})

export class MensajeriaComponent implements OnInit {
  @Input() mascotaId!: number;
  @Input() receptorId!: number;

  mensajes: any[] = [];
  nuevoMensaje: string = '';
  apiUrl = 'http://localhost:8000/api';

constructor(private http: HttpClient, private route: ActivatedRoute) {}

 ngOnInit(): void {
  this.route.params.subscribe(params => {
    this.mascotaId = +params['mascotaId'];
    this.receptorId = +params['receptorId'];
    this.cargarMensajes();
  });
}
  getAuthHeaders(): HttpHeaders {
    const token = localStorage.getItem('token');
    return new HttpHeaders({
      Authorization: `Bearer ${token}`
    });
  }

  cargarMensajes(): void {
    this.http.get<any[]>(`${this.apiUrl}/mensajes/${this.mascotaId}`, {
      headers: this.getAuthHeaders()
    }).subscribe({
      next: res => this.mensajes = res,
      error: err => console.error('Error al cargar mensajes:', err)
    });
  }

  enviarMensaje(): void {
    if (!this.nuevoMensaje.trim()) return;

    const payload = {
      mascota_id: this.mascotaId,
      receptor_id: this.receptorId,
      contenido: this.nuevoMensaje.trim()
    };

    this.http.post(`${this.apiUrl}/mensajes`, payload, {
      headers: this.getAuthHeaders()
    }).subscribe({
      next: res => {
        this.mensajes.push(res);
        this.nuevoMensaje = '';
      },
      error: err => console.error('Error al enviar mensaje:', err)
    });
  }
}
