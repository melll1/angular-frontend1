import { Component, OnInit, AfterViewInit  } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { DesparasitacionService } from '../../services/desparasitacion.service';
import { ActivatedRoute, Router } from '@angular/router';

// Materialize CSS
declare const M: any;

@Component({
  selector: 'app-desparasitaciones',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './desparasitaciones.component.html',
  styleUrls: ['./desparasitaciones.component.css']
})
export class DesparasitacionesComponent implements OnInit, AfterViewInit {
  desparasitaciones: any[] = [];
  desparasitacionesFiltradas: any[] = [];

  nuevaDesparasitacion: any = {
    nombre: '',
    fecha_aplicacion: '',
    proxima_dosis: '',
    tipo: '', // 'Interna' o 'Externa'
    observaciones: '',
    mascota_id: ''
  };
mostrarFormulario = true; // se muestra por defecto
mascotaFiltrada: any = null; 
filtroMascota: string = '';
filtroTipo: string = ''; // <-- Agregado para evitar el error de propiedad inexistente
modoEdicion = false;
idEditando: number | null = null;
desdeHistorial = false;

  constructor(
    private desparasitacionService: DesparasitacionService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngAfterViewInit(): void {
    setTimeout(() => {
      const elems = document.querySelectorAll('select');
      M.FormSelect.init(elems);
    }, 0);
  }

  ngOnInit(): void {
  this.route.queryParams.subscribe(params => {
    if (params['editar']) {
      this.modoEdicion = true;
      this.idEditando = Number(params['id']);

      this.nuevaDesparasitacion = {
        nombre: params['nombre'],
        fecha_aplicacion: params['fecha_aplicacion'],
        proxima_dosis: params['proxima_dosis'] || '',
        tipo: params['tipo'] || '',
        observaciones: params['observaciones'] || '',
        mascota_id: Number(params['mascota_id'])
      };
      this.desdeHistorial = true;
    } else if (params['mascota_id'] && params['fecha_aplicacion'] && params['tipo']) {
        this.nuevaDesparasitacion = {
          nombre: '',
          fecha_aplicacion: params['fecha_aplicacion'],
          proxima_dosis: '',
          tipo: params['tipo'],
          observaciones: '',
          mascota_id: Number(params['mascota_id'])
        };
        this.desdeHistorial = true;
      }
    });

  this.cargarDesparasitaciones();
}


  cargarDesparasitaciones(): void {
    this.desparasitacionService.obtenerDesparasitaciones().subscribe({
  next: (data: any) => {
    this.desparasitaciones = data;
    this.desparasitacionesFiltradas = data; // Aquí se copia para filtrado
  },
  error: (err: any) => console.error('Error al cargar:', err)
});
  }

  guardarDesparasitacion(): void {
    if (this.modoEdicion && this.idEditando !== null) {
      this.desparasitacionService.actualizarDesparasitacion(this.idEditando, this.nuevaDesparasitacion).subscribe({
        next: () => {
          this.cargarDesparasitaciones();
          this.cancelarEdicion();
          alert('Desparasitación actualizada.');
        },
        error: () => alert('Error al actualizar.')
      });
    } else {
      this.desparasitacionService.crearDesparasitacion(this.nuevaDesparasitacion).subscribe({
        next: (res: any) => {
          alert('Desparasitación registrada.');
          this.limpiarFormulario();
          this.desparasitaciones.push(res.desparasitacion);
        },
        error: () => alert('Error al registrar.')
      });
    }
  }


limpiarFormulario(): void {
  this.nuevaDesparasitacion = {
    nombre: '',
    fecha_aplicacion: '',
    proxima_dosis: '',
    tipo: '',
    observaciones: '',
    mascota_id: ''
  };
  this.modoEdicion = false;
  this.idEditando = null;
}


  editarDesparasitacion(despa: any): void {
    this.modoEdicion = true;
    this.idEditando = despa.id;
    this.nuevaDesparasitacion = { ...despa };
  }

 cancelarEdicion(): void {
    this.limpiarFormulario();
  }

  eliminarDesparasitacion(id: number): void {
    if (confirm('¿Eliminar esta desparasitación?')) {
      this.desparasitacionService.eliminarDesparasitacion(id).subscribe({
        next: () => {
          this.desparasitaciones = this.desparasitaciones.filter(d => d.id !== id);
          alert('Desparasitación eliminada.');
        },
        error: () => alert('Error al eliminar.')
      });
    }
  }

  toggleFormulario(): void {
  this.mostrarFormulario = !this.mostrarFormulario;
}

 aplicarFiltros(): void {
    this.desparasitacionesFiltradas = this.desparasitaciones.filter(t =>
      !this.filtroMascota || t.mascota?.id.toString().includes(this.filtroMascota)
    );
  }

  buscarMascotaFiltrada(): void {
    const id = parseInt(this.filtroMascota, 10);
    if (!isNaN(id)) {
      const conMascota = this.desparasitaciones.find(t => t.mascota?.id === id);
      this.mascotaFiltrada = conMascota ? conMascota.mascota : null;
    } else {
      this.mascotaFiltrada = null;
    }
    this.aplicarFiltros();
  }

}
