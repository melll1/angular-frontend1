import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { VacunaService } from '../services/vacuna.service';
import { HttpClientModule } from '@angular/common/http';
import { ActivatedRoute, Router } from '@angular/router';

// Agrega esta declaración para que TypeScript reconozca 'M' como global
declare const M: any;


@Component({
  selector: 'app-vacunas',
standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './vacunas.component.html',
  styleUrls: ['./vacunas.component.css'] // <- corregido aquí
})
export class VacunasComponent implements OnInit {
vacunas: any[] = [];

  nuevaVacuna: any = {
    nombre: '',
    fecha_aplicacion: '',
    proxima_dosis: '',
    lote: '',
    observaciones: '',
    mascota_id: ''
  };

  modoEdicion = false;
  idEditando: number | null = null;
  desdeHistorial = false; // 🔍 Indica si viene desde historial médico

  constructor(private vacunaService: VacunaService,  private route: ActivatedRoute, private router: Router ) {}
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
        this.nuevaVacuna = {
          nombre: params['nombre'] || '',
          fecha_aplicacion: params['fecha_aplicacion'] || '',
          proxima_dosis: params['proxima_dosis'] || '',
          lote: params['lote'] || '',
          observaciones: params['observaciones'] || '',
          mascota_id: Number(params['mascota_id']) || ''
        };
        this.desdeHistorial = true;
      } else if (params['mascota_id'] && params['fecha_aplicacion']) {
        // Si viene desde historial médico con datos
        this.nuevaVacuna = {
          ...this.nuevaVacuna,
          nombre: params['nombre'] || '',
          fecha_aplicacion: params['fecha_aplicacion'],
          mascota_id: Number(params['mascota_id'])
        };
        this.desdeHistorial = true;
      }
    });

    this.cargarVacunas();
  }


  cargarVacunas(): void {
    this.vacunaService.obtenerVacunas().subscribe({
      next: (data:any) => this.vacunas = data,
      error: (err:any) => console.error('Error al cargar vacunas:', err)
    });
  }

 guardarVacuna(): void {
  if (this.modoEdicion && this.idEditando !== null) {
    this.vacunaService.actualizarVacuna(this.idEditando, this.nuevaVacuna).subscribe({
      next: () => {
        const historialActualizado = {
          descripcion: `Vacuna aplicada: ${this.nuevaVacuna.nombre}`,
          fecha: this.nuevaVacuna.fecha_aplicacion,
          tipo: 'Vacuna'
        };

        this.vacunaService.actualizarHistorialPorVacunaId(this.idEditando!, historialActualizado).subscribe({
          next: () => {
            this.cargarVacunas();
            this.cancelarEdicion();
            alert('Vacuna y historial actualizados.');
          },
          error: () => alert('Vacuna actualizada, pero no se pudo actualizar el historial.')
        });
      },
      error: () => alert('Error al actualizar la vacuna.')
    });
  } else {
    this.vacunaService.crearVacuna(this.nuevaVacuna).subscribe({
        next: (res: any) => {
          const vacuna = res.vacuna;

          this.vacunas.push(vacuna);
          this.nuevaVacuna = {
            nombre: '',
            fecha_aplicacion: '',
            proxima_dosis: '',
            lote: '',
            observaciones: '',
            mascota_id: ''
          };
          alert('Vacuna y historial registrados.');
        },
        error: () => alert('Error al registrar vacuna.')
      });
    }
  }


  // Editar una vacuna existente

  editarVacuna(vacuna: any): void {
    this.modoEdicion = true;
    this.idEditando = vacuna.id;
    this.nuevaVacuna = { ...vacuna };
  }
  // Cancelar la edición de una vacuna
  cancelarEdicion(): void {
    this.modoEdicion = false;
    this.idEditando = null;
    this.nuevaVacuna = { nombre: '',
      fecha_aplicacion: '',
      proxima_dosis: '',
      lote: '',
      observaciones: '',
      mascota_id: '' };
  }
  // Eliminar una vacuna
  eliminarVacuna(id: number): void {
    if (confirm('¿Eliminar esta vacuna?')) {
      this.vacunaService.eliminarVacuna(id).subscribe({
        next: () => {
          this.vacunas = this.vacunas.filter(v => v.id !== id);
          alert('Vacuna eliminada.');
        },
        error: () => alert('Error al eliminar vacuna.')
      });
    }
  }
}
