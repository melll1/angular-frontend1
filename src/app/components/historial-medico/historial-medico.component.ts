import { Component, OnInit , AfterViewInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HistorialService } from '../../services/historial.service';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { VacunaService } from '../../services/vacuna.service';
import { MascotasService } from '../../services/mascotas.service';

declare const M: any;

@Component({
  selector: 'app-historial-medico',
  standalone: true,
  imports: [CommonModule, HttpClientModule, FormsModule],
  templateUrl: './historial-medico.component.html',
  styleUrls: ['./historial-medico.component.css']
})
export class HistorialMedicoComponent implements OnInit, AfterViewInit {
  historiales: any[] = [];
  mascotas: any[] = [];
  historialesFiltrados: any[] = [];
  mascotaFiltrada: any = null; 
  // Datos para el nuevo historial
  nuevoHistorial: any = {
    mascota_id: '',
    descripcion: '',
    fecha: '',
    tipo: '',
  };

  mascotaSeleccionada: any = null;
  // Modo de edición
  modoEdicion: boolean = false;
  idEditando: number | null = null;

  // Filtros y rol del usuario
  filtroMascota: string = '';
  filtroTipo: string = '';
  role: string = '';
  nombreMascota: string = '';
  mostrarFormulario: boolean = false;

  constructor(
    private historialService: HistorialService,
    private route: ActivatedRoute,
    private router: Router,
    private vacunaService: VacunaService,
    private mascotaService: MascotasService,
  ) {}

  ngAfterViewInit(): void {
    this.inicializarSelect();
  }

  inicializarSelect(): void {
    const elems = document.querySelectorAll('select');
    M.FormSelect.init(elems);
  }

  toggleFormulario(): void {
    this.mostrarFormulario = !this.mostrarFormulario;
    if (this.mostrarFormulario) {
      setTimeout(() => this.inicializarSelect(), 0);
    }
  }

  ngOnInit(): void {
    this.role = localStorage.getItem('role') || '';
    this.nombreMascota = localStorage.getItem('nombreMascota') || '';

// Cargar historial por mascota específica si se pasa ID por ruta
    this.route.paramMap.subscribe(params => {
      const mascotaId = params.get('id');
      if (mascotaId) {
        this.obtenerHistorialPorMascota(+mascotaId);
      } else {
        this.obtenerHistoriales();
      }
    });
     this.cargarMascotas();
  }

  cargarMascotas(): void {
    this.mascotaService.obtenerMascotas().subscribe({
      next: (data) => this.mascotas = data,
      error: () => console.error('Error al cargar mascotas')
    });
  }

  obtenerHistoriales(): void {
    this.historialService.obtenerHistoriales().subscribe({
      next: (data: any) => {
        this.historiales = data;
        this.historialesFiltrados = data;
        this.inicializarSelect();
      },
      error: (err) => console.error('Error al obtener historial médico:', err)
    });
  }

   obtenerHistorialPorMascota(mascotaId: number): void {
    this.historialService.obtenerHistorialesDeMascota(mascotaId).subscribe({
      next: (data: any) => {
        this.historiales = data;
        this.historialesFiltrados = data;
        if (data.length > 0 && data[0].mascota?.nombre) {
          this.nombreMascota = data[0].mascota.nombre;
        }
        this.inicializarSelect();
      },
      error: (err) => console.error('Error al obtener historial por mascota:', err)
    });
  }

  aplicarFiltros(): void {
    this.historialesFiltrados = this.historiales.filter(h =>
      (!this.filtroMascota || h.mascota_id.toString().includes(this.filtroMascota)) &&
      (!this.filtroTipo || h.tipo.toLowerCase().includes(this.filtroTipo.toLowerCase()))
    );
  }

  editarHistorial(historial: any): void {
    if (historial.tipo === 'Vacuna') {
      this.router.navigate(['/vacunas'], {
        queryParams: {
          editar: true,
          id: historial.vacuna_id,
          nombre: historial.descripcion.replace('Vacuna aplicada: ', ''),
          fecha_aplicacion: historial.fecha,
          mascota_id: historial.mascota_id
        }
      });
    } else if (historial.tipo === 'Tratamiento') {
      this.router.navigate(['/tratamientos'], {
        queryParams: {
          editar: true,
          id: historial.tratamiento_id,
          mascota_id: historial.mascota_id,
          fecha_inicio: historial.fecha,
          descripcion: historial.descripcion.replace('Tratamiento: ', '')
        }
      });
    }
    else if (historial.tipo === 'Desparasitación') {
      this.router.navigate(['/desparasitaciones'], {
        queryParams: {
          editar: true,
          id: historial.desparasitacion_id,
          nombre: historial.descripcion.replace('Desparasitación interna: ', '').replace('Desparasitación externa: ', ''),
          fecha_aplicacion: historial.fecha,
          mascota_id: historial.mascota_id
        }
      });
    }if (historial.tipo === 'Diagnostico') {
    this.router.navigate(['/diagnosticos'], {
      queryParams: {
        editar: true,
          id: historial.diagnostico_id,
        mascota_id: historial.mascota_id,
        fecha: historial.fecha,
        descripcion: historial.descripcion.replace('Diagnostico: ', '')
      }
    });
    return;
  }
 else {
      this.modoEdicion = true;
      this.idEditando = historial.id;
      this.nuevoHistorial = { ...historial };
    }
  }
  
  cancelarEdicion(): void {
    this.modoEdicion = false;
    this.idEditando = null;
    this.nuevoHistorial = { mascota_id: '', descripcion: '', fecha: '', tipo: '' };
  }

  guardarHistorial(): void {
    // 🔠 Normalizar tipos
    const tipoNormalizado = this.nuevoHistorial.tipo?.toLowerCase();
  
    if (tipoNormalizado === 'vacuna') {
      if (this.modoEdicion && this.idEditando) {
        this.vacunaService.obtenerHistorialPorVacuna(this.idEditando).subscribe({
          next: (historial: any) => {
            const vacunaId = historial.vacuna_id;
            const vacunaActualizada = {
              nombre: this.nuevoHistorial.descripcion.replace('Vacuna aplicada: ', ''),
              fecha_aplicacion: this.nuevoHistorial.fecha,
              mascota_id: this.nuevoHistorial.mascota_id
            };
            this.vacunaService.actualizarVacuna(vacunaId, vacunaActualizada).subscribe({
              next: () => {
                this.historialService.actualizarHistorial(this.idEditando!, {
                  descripcion: 'Vacuna aplicada: ' + vacunaActualizada.nombre,
                  fecha: vacunaActualizada.fecha_aplicacion,
                  tipo: 'Vacuna'
                }).subscribe(() => {
                  this.cargarHistoriales();
                  this.cancelarEdicion();
                  alert('Historial y vacuna actualizados');
                });
              },
              error: () => alert('Error actualizando la vacuna.')
            });
          },
          error: () => alert('Historial no encontrado.')
        });
      } else {
        this.router.navigate(['/vacunas'], {
          queryParams: {
            mascota_id: this.nuevoHistorial.mascota_id,
            fecha_aplicacion: this.nuevoHistorial.fecha,
            tipo: this.nuevoHistorial.descripcion
          }
        });
      }
      return;
    }
  
    if (tipoNormalizado === 'desparasitación' || tipoNormalizado === 'desparasitacion') {
      this.router.navigate(['/desparasitaciones'], {
        queryParams: {
          mascota_id: this.nuevoHistorial.mascota_id,
          fecha_aplicacion: this.nuevoHistorial.fecha,
          tipo: this.nuevoHistorial.descripcion
        }
      });
      return;
    }
  
    if (tipoNormalizado === 'tratamiento') {
      this.router.navigate(['/tratamientos'], {
        queryParams: {
          mascota_id: this.nuevoHistorial.mascota_id,
          fecha_inicio: this.nuevoHistorial.fecha,
          descripcion: this.nuevoHistorial.descripcion
        }
      });
      return;
    }
  
   if (tipoNormalizado === 'diagnostico') {
  this.router.navigate(['/diagnosticos'], {
    queryParams: {
      mascota_id: this.nuevoHistorial.mascota_id,
          fecha: this.nuevoHistorial.fecha,
          descripcion: this.nuevoHistorial.descripcion
    }
  });
  return;
}if (tipoNormalizado === 'visita al veterinario') {
  if (this.modoEdicion && this.idEditando) {
    this.historialService.actualizarHistorial(this.idEditando, this.nuevoHistorial).subscribe({
      next: () => {
        this.cargarHistoriales();
        this.cancelarEdicion();
        alert('Visita actualizada.');
      },
      error: () => alert('Error al actualizar la visita.')
    });
  } else {
    this.historialService.crearHistorial(this.nuevoHistorial).subscribe({
      next: (res: any) => {
        this.historiales.push(res.registro);
        this.nuevoHistorial = { mascota_id: '', descripcion: '', fecha: '', tipo: '' };
        this.aplicarFiltros();
        alert('Visita guardada.');
      },
      error: () => alert('Error al guardar la visita.')
    });
  }
  return; // importante: evita que siga a otras condiciones
}


    // Si no es ninguno de los anteriores, guardar como historial simple
    if (this.modoEdicion && this.idEditando) {
      this.historialService.actualizarHistorial(this.idEditando, this.nuevoHistorial).subscribe({
        next: () => {
          this.cargarHistoriales();
          this.cancelarEdicion();
          alert('Historial actualizado.');
        },
        error: () => alert('Error al actualizar.')
      });
    } else {
      this.historialService.crearHistorial(this.nuevoHistorial).subscribe({
        next: (res: any) => {
          this.historiales.push(res.registro);
          this.nuevoHistorial = { mascota_id: '', descripcion: '', fecha: '', tipo: '' };
          alert('Historial guardado.');
        },
        error: () => alert('Error al guardar.')
      });
    }
  }
  

  cargarHistoriales(): void {
    this.obtenerHistoriales();
  }

  

 

  limpiarFiltros(): void {
    this.filtroMascota = '';
    this.filtroTipo = '';
    this.aplicarFiltros();
  }


  eliminarHistorial(id: number): void {
  if (confirm('¿Eliminar esta visita?')) {
    this.historialService.eliminarHistorial(id).subscribe({
      next: () => {
        this.historiales = this.historiales.filter(h => h.id !== id);
        this.aplicarFiltros();
        alert('Visita eliminada.');
      },
      error: () => alert('Error al eliminar la visita.')
    });
  }
}

buscarMascotaPorId(id: number): void {
  this.mascotaSeleccionada = this.mascotas.find(m => m.id === id) || null;
}

buscarMascotaFiltrada(): void {
  const id = parseInt(this.filtroMascota, 10);
  if (!isNaN(id)) {
    this.mascotaFiltrada = this.mascotas.find(m => m.id === id) || null;
  } else {
    this.mascotaFiltrada = null;
  }
}

}
