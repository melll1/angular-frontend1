import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Router } from '@angular/router';
import { MatListModule } from '@angular/material/list';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Component({
  selector: 'app-bandeja-mensajes',
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
    MatListModule,
    MatIconModule,
    MatButtonModule
  ],
  templateUrl: './bandeja-mensajes.component.html',
  styleUrls: ['./bandeja-mensajes.component.css']
})
export class BandejaMensajesComponent implements OnInit {
 mascotasSinChat: any[] = [];
  conversaciones: any[] = [];
  

  constructor(private http: HttpClient, private router: Router) {}

 


ngOnInit(): void {
  this.cargarConversaciones();
  this.cargarMascotasSinChat(); // 👈 añadimos esto
}


  getAuthHeaders(): HttpHeaders {
    const token = localStorage.getItem('token');
    return new HttpHeaders({
      Authorization: `Bearer ${token}`
    });
  }

 cargarConversaciones(): void {
  this.http.get<any[]>('http://localhost:8000/api/mensajes/conversaciones', {
    headers: this.getAuthHeaders()
  }).subscribe({
    next: res => {
      this.conversaciones = res.map(c => ({
        mascota_id: c.mascota.id,
        mascota_nombre: c.mascota.nombre,
        receptor_id: c.conversacion_con.id,
        nombre_otro_usuario: c.conversacion_con.nombre,
        ultimo_mensaje: c.ultimo_mensaje
      }));
    },
    error: err => console.error('Error al cargar conversaciones:', err)
  });
}


  irAlChat(mascotaId: number, receptorId: number): void {
    this.router.navigate(['/mensajeria', mascotaId, receptorId]);
  }

 cargarMascotasSinChat(): void {
  this.http.get<any[]>('http://localhost:8000/api/mensajes/mascotas-sin-chat', {
    headers: this.getAuthHeaders()
  }).subscribe({
    next: res => {
      console.log('➡️ Mascotas sin chat desde el backend:', res); // <-- agrega esto
      this.mascotasSinChat = res;
    },
    error: err => console.error('❌ Error al cargar mascotas sin chat:', err)
  });
}


iniciarChat(mascotaId: number, receptorId: number): void {
  this.router.navigate(['/mensajeria', mascotaId, receptorId]);
}

}
