import { Component, OnInit , AfterViewInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HistorialService } from '../services/historial.service';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { VacunaService } from '../services/vacuna.service';

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
  nuevoHistorial: any = {
    mascota_id: '',
    descripcion: '',
    fecha: '',
    tipo: ''
  };
  modoEdicion: boolean = false;
  idEditando: number | null = null;
  filtroMascota: string = '';
  filtroTipo: string = '';
  historialesFiltrados: any[] = [];
  role: string = '';
  nombreMascota: string = '';
  mostrarFormulario: boolean = false;

  constructor(
    private historialService: HistorialService,
    private route: ActivatedRoute,
    private router: Router,
    private vacunaService: VacunaService,
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

    this.route.paramMap.subscribe(params => {
      const mascotaId = params.get('id');
      if (mascotaId) {
        this.obtenerHistorialPorMascota(+mascotaId);
      } else {
        this.obtenerHistoriales();
      }
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
    } else {
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
    if (this.nuevoHistorial.tipo === 'Vacuna') {
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

    if (this.nuevoHistorial.tipo === 'Desparasitación') {
      this.router.navigate(['/desparasitaciones'], {
        queryParams: {
          mascota_id: this.nuevoHistorial.mascota_id,
          fecha_aplicacion: this.nuevoHistorial.fecha,
          tipo: this.nuevoHistorial.descripcion
        }
      });
      return;
    }

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

  aplicarFiltros(): void {
    this.historialesFiltrados = this.historiales.filter(h =>
      (!this.filtroMascota || h.mascota_id.toString().includes(this.filtroMascota)) &&
      (!this.filtroTipo || h.tipo.toLowerCase().includes(this.filtroTipo.toLowerCase()))
    );
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

  limpiarFiltros(): void {
    this.filtroMascota = '';
    this.filtroTipo = '';
    this.aplicarFiltros();
  }

  volver(): void {
    this.router.navigate(['/lista-mascotas']);
  }
}
