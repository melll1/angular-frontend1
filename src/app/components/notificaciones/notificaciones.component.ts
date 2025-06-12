import { Component, OnInit } from '@angular/core';
import { NotificacionService } from '../../services/notificacion.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-notificaciones',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './notificaciones.component.html',
  styleUrls: ['./notificaciones.component.css']
})
export class NotificacionesComponent implements OnInit {
  notificaciones: any[] = [];

  constructor(private notificacionService: NotificacionService) {}

  ngOnInit(): void {
    this.cargarNotificaciones();
  }

  cargarNotificaciones(): void {
    this.notificacionService.obtenerNotificaciones().subscribe({
      next: (data: any[]) => {
        this.notificaciones = data;
      },
      error: (err: any) => {
        console.error('Error al cargar notificaciones', err);
      }
    });
  }

  marcarLeida(id: number): void {
    this.notificacionService.marcarComoLeida(id).subscribe({
      next: () => {
        this.cargarNotificaciones();
      },
      error: (err: any) => {
        console.error('Error al marcar como leída', err);
        alert('Error al marcar como leída');
      }
    });
  }

  marcarTodasLeidas(): void {
  this.notificacionService.marcarTodasLeidas().subscribe({
    next: () => {
      this.cargarNotificaciones(); // Actualiza la lista
    },
    error: err => {
      console.error('Error al marcar todas como leídas', err);
      alert('Error al marcar todas como leídas');
    }
  });
}

responderCita(notificacion: any, estado: 'aceptada' | 'rechazada'): void {
  if (!confirm(`¿Estás seguro de ${estado === 'aceptada' ? 'aceptar' : 'rechazar'} esta cita?`)) return;

  this.notificacionService.responderCita(notificacion.mascota_id, estado, notificacion.id).subscribe({
    next: () => {
      alert(`Cita ${estado === 'aceptada' ? 'aceptada' : 'rechazada'} correctamente`);
      this.cargarNotificaciones();
    },
    error: err => {
      console.error('Error al responder cita', err);
      alert('Error al responder la cita');
    }
  });
}

}
