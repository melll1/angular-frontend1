import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatChipsModule } from '@angular/material/chips';
import { MensajeriaService } from '../../services/mensajeria.service';

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
  usuarioActualId!: number;

  constructor(
    private mensajeriaService: MensajeriaService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.usuarioActualId = Number(localStorage.getItem('user_id'));

    this.route.params.subscribe(params => {
      this.mascotaId = +params['mascotaId'];
      this.receptorId = +params['receptorId'];
      this.cargarMensajes();
    });
  }

  cargarMensajes(): void {
    this.mensajeriaService.obtenerMensajesPorMascota(this.mascotaId).subscribe({
      next: res => this.mensajes = res,
      error: err => console.error('❌ Error al cargar mensajes:', err)
    });
  }

  enviarMensaje(): void {
    console.log('📦 Payload a enviar:', {
  mascota_id: this.mascotaId,
  receptor_id: this.receptorId,
  contenido: this.nuevoMensaje.trim()
});

    if (!this.nuevoMensaje.trim()) return;

    const payload = {
      mascota_id: this.mascotaId,
      receptor_id: this.receptorId,
      contenido: this.nuevoMensaje.trim()
    };

    this.mensajeriaService.enviarMensaje(payload).subscribe({
      next: res => {
        this.mensajes.push(res);
        this.nuevoMensaje = '';
      },
      error: err => console.error('❌ Error al enviar mensaje:', err)
    });
  }
}
