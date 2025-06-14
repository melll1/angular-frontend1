import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Router } from '@angular/router';
import { MatListModule } from '@angular/material/list';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MensajesService } from '../../services/mensajes.service'; // Ajusta la ruta si es diferente

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

  constructor(
    private mensajesService: MensajesService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.cargarConversaciones();
    this.cargarMascotasSinChat();
  }

  cargarConversaciones(): void {
    this.mensajesService.obtenerConversaciones().subscribe({
      next: res => {
        console.log('🟢 Conversaciones cargadas:', res);
        this.conversaciones = res.map(c => ({
          mascota_id: c.mascota.id,
          mascota_nombre: c.mascota.nombre,
          receptor_id: c.conversacion_con.id,
          nombre_otro_usuario: c.conversacion_con.nombre,
          ultimo_mensaje: c.ultimo_mensaje
        }));
      },
      error: err => console.error('❌ Error al cargar conversaciones:', err)
    });
  }

  cargarMascotasSinChat(): void {
    this.mensajesService.obtenerMascotasSinChat().subscribe({
      next: res => {
        console.log('➡️ Mascotas sin chat desde el backend:', res);
        this.mascotasSinChat = res;
      },
      error: err => console.error('❌ Error al cargar mascotas sin chat:', err)
    });
  }

  irAlChat(mascotaId: number, receptorId: number): void {
    this.router.navigate(['/mensajeria', mascotaId, receptorId]);
  }

  iniciarChat(mascotaId: number, receptorId: number): void {
    this.router.navigate(['/mensajeria', mascotaId, receptorId]);
  }
}
