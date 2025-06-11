import { Component, OnInit } from '@angular/core';
import { TratamientoService } from '../../services/tratamiento.service';
import { ActivatedRoute } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-tratamientos',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './tratamientos.component.html',
  styleUrls: ['./tratamientos.component.css']
})
export class TratamientosComponent implements OnInit {
  tratamientos: any[] = [];
  tratamientosFiltrados: any[] = [];

  nuevoTratamiento: any = {
    nombre: '',
    fecha_inicio: '',
    fecha_fin: '',
    descripcion: '',
    observaciones: '',
    frecuencia_minutos: null,
    mascota_id: ''
  };

  mostrarFormulario = true;
  filtroMascota = '';
  mascotaFiltrada: any = null;
  modoEdicion = false;
  idEditando: number | null = null;

  constructor(
    private tratamientoService: TratamientoService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      if (params['mascota_id'] && params['fecha_inicio']) {
        this.nuevoTratamiento.mascota_id = Number(params['mascota_id']);
        this.nuevoTratamiento.fecha_inicio = params['fecha_inicio'];
        this.nuevoTratamiento.descripcion = params['descripcion'] || '';
      }
    });

    this.cargarTratamientos();
  }

  cargarTratamientos(): void {
    this.tratamientoService.obtenerTodos().subscribe({
      next: (data: any) => {
        this.tratamientos = data;
        this.tratamientosFiltrados = data;
        this.buscarMascotaFiltrada();
      },
      error: err => console.error('Error al cargar tratamientos', err)
    });
  }

  aplicarFiltros(): void {
    this.tratamientosFiltrados = this.tratamientos.filter(t =>
      !this.filtroMascota || t.mascota?.id.toString().includes(this.filtroMascota)
    );
  }

  buscarMascotaFiltrada(): void {
    const id = parseInt(this.filtroMascota, 10);
    if (!isNaN(id)) {
      const conMascota = this.tratamientos.find(t => t.mascota?.id === id);
      this.mascotaFiltrada = conMascota ? conMascota.mascota : null;
    } else {
      this.mascotaFiltrada = null;
    }
    this.aplicarFiltros();
  }

  toggleFormulario(): void {
    this.mostrarFormulario = !this.mostrarFormulario;
  }

  guardarTratamiento(): void {
    if (this.modoEdicion && this.idEditando !== null) {
      this.tratamientoService.actualizarTratamiento(this.idEditando, this.nuevoTratamiento).subscribe({
        next: () => {
          this.cargarTratamientos();
          this.cancelarEdicion();
          alert('Tratamiento actualizado correctamente.');
        },
        error: () => alert('Error al actualizar el tratamiento.')
      });
    } else {
      this.tratamientoService.crearTratamiento(this.nuevoTratamiento).subscribe({
        next: (res: any) => {
          this.tratamientos.push(res.tratamiento);
          this.tratamientosFiltrados = this.tratamientos;
          this.cancelarEdicion();
          alert('Tratamiento registrado correctamente.');
        },
        error: () => alert('Error al registrar tratamiento.')
      });
    }
  }

  editarTratamiento(tratamiento: any): void {
    this.modoEdicion = true;
    this.idEditando = tratamiento.id;
    this.nuevoTratamiento = { ...tratamiento };
    if (!this.mostrarFormulario) this.toggleFormulario();
  }

  cancelarEdicion(): void {
    this.modoEdicion = false;
    this.idEditando = null;
    this.nuevoTratamiento = {
      nombre: '',
      fecha_inicio: '',
      fecha_fin: '',
      descripcion: '',
      observaciones: '',
      frecuencia_minutos: null,
      mascota_id: ''
    };
  }

  eliminarTratamiento(id: number): void {
    if (confirm('¿Eliminar este tratamiento?')) {
      this.tratamientoService.eliminarTratamiento(id).subscribe({
        next: () => {
          this.tratamientos = this.tratamientos.filter(t => t.id !== id);
          this.aplicarFiltros();
          alert('Tratamiento eliminado.');
        },
        error: err => console.error('Error al eliminar:', err)
      });
    }
  }
}
