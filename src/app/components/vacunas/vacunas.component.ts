import { Component, OnInit, AfterViewInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { VacunaService } from '../../services/vacuna.service';
import { MascotasService } from '../../services/mascotas.service';
import { ActivatedRoute, Router } from '@angular/router';

declare const M: any;

@Component({
  selector: 'app-vacunas',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './vacunas.component.html',
  styleUrls: ['./vacunas.component.css']
})
export class VacunasComponent implements OnInit, AfterViewInit {
  vacunas: any[] = [];
  vacunasFiltradas: any[] = [];
  mascotas: any[] = [];

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
  desdeHistorial = false;
  filtroTipo: string = '';
  mostrarFormulario: boolean = true;
  filtroMascota: string = '';
  mascotaFiltrada: any = null;

  constructor(
    private vacunaService: VacunaService,
    private mascotaService: MascotasService,
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
    this.cargarMascotas();
  }

  cargarVacunas(): void {
    this.vacunaService.obtenerVacunas().subscribe({
      next: (data: any) => {
        this.vacunas = data;
        this.vacunasFiltradas = data;
      },
      error: (err: any) => console.error('Error al cargar vacunas:', err)
    });
  }

  cargarMascotas(): void {
    this.mascotaService.obtenerMascotas().subscribe({
      next: (data: any) => this.mascotas = data,
      error: () => console.error('Error al cargar mascotas')
    });
  }

  toggleFormulario(): void {
    this.mostrarFormulario = !this.mostrarFormulario;
  }

   buscarMascotaFiltrada(): void {
    const id = parseInt(this.filtroMascota, 10);
    if (!isNaN(id)) {
      const conMascota = this.vacunas.find(t => t.mascota?.id === id);
      this.mascotaFiltrada = conMascota ? conMascota.mascota : null;
    } else {
      this.mascotaFiltrada = null;
    }
    this.aplicarFiltros();
  }


  guardarVacuna(): void {
    if (this.modoEdicion && this.idEditando !== null) {
      this.vacunaService.actualizarVacuna(this.idEditando, this.nuevaVacuna).subscribe({
        next: () => {
          this.cargarVacunas();
          this.cancelarEdicion();
          alert('Vacuna actualizada.');
        },
        error: () => alert('Error al actualizar vacuna.')
      });
    } else {
      this.vacunaService.crearVacuna(this.nuevaVacuna).subscribe({
        next: (res: any) => {
          this.vacunas.push(res.vacuna);
          this.nuevaVacuna = {
            nombre: '',
            fecha_aplicacion: '',
            proxima_dosis: '',
            lote: '',
            observaciones: '',
            mascota_id: ''
          };
          alert('Vacuna registrada.');
          this.buscarMascotaFiltrada(); // actualiza la vista filtrada
        },
        error: () => alert('Error al registrar vacuna.')
      });
    }
  }

  editarVacuna(vacuna: any): void {
    this.modoEdicion = true;
    this.idEditando = vacuna.id;
    this.nuevaVacuna = { ...vacuna };
  }

  cancelarEdicion(): void {
    this.modoEdicion = false;
    this.idEditando = null;
    this.nuevaVacuna = {
      nombre: '',
      fecha_aplicacion: '',
      proxima_dosis: '',
      lote: '',
      observaciones: '',
      mascota_id: ''
    };
  }

  eliminarVacuna(id: number): void {
    if (confirm('¿Eliminar esta vacuna?')) {
      this.vacunaService.eliminarVacuna(id).subscribe({
        next: () => {
          this.vacunas = this.vacunas.filter(v => v.id !== id);
          alert('Vacuna eliminada.');
          this.buscarMascotaFiltrada();
        },
        error: () => alert('Error al eliminar vacuna.')
      });
    }
  }

  aplicarFiltros(): void {
    this.vacunasFiltradas = this.vacunas.filter(t =>
      !this.filtroMascota || t.mascota?.id.toString().includes(this.filtroMascota)
    );
  }

}
