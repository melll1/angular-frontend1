import { Component, OnInit, AfterViewInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { ActivatedRoute, Router } from '@angular/router';
import { DiagnosticoService } from '../../services/diagnostico.service';
import { MascotasService } from '../../services/mascotas.service';

declare const M: any;

@Component({
  selector: 'app-diagnosticos',
  standalone: true,
  imports: [CommonModule, FormsModule, HttpClientModule],
  templateUrl: './diagnosticos.component.html',
  styleUrls: ['./diagnosticos.component.css']
})
export class DiagnosticosComponent implements OnInit, AfterViewInit {
  diagnosticos: any[] = [];
  diagnosticosFiltrados: any[] = [];

  nuevoDiagnostico: any = {
    titulo: '',
    descripcion: '',
    fecha: '',
    mascota_id: ''
  };

  mostrarFormulario = true;
  filtroMascota = '';
  mascotaFiltrada: any = null;

  modoEdicion: boolean = false;
  idEditando: number | null = null;
  desdeHistorial: boolean = false;

  constructor(
    private diagnosticoService: DiagnosticoService,
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
      if (params['editar'] && params['id']) {
        this.modoEdicion = true;
        this.idEditando = Number(params['id']);
        this.nuevoDiagnostico = {
          titulo: params['titulo'] || '',
          descripcion: params['descripcion'] || '',
          fecha: params['fecha'] || '',
          mascota_id: Number(params['mascota_id']) || ''
        };
        this.desdeHistorial = true;
      } else if (params['mascota_id'] && params['fecha'] && params['descripcion']) {
        this.nuevoDiagnostico = {
          titulo: '',
          descripcion: params['descripcion'],
          fecha: params['fecha'],
          mascota_id: +params['mascota_id']
        };
        this.desdeHistorial = true;
      }
    });

    this.cargarDiagnosticos();
    this.cargarMascotas();
  }

  cargarDiagnosticos(): void {
    this.diagnosticoService.obtenerDiagnosticos().subscribe({
      next: (data: any) => {
        this.diagnosticos = data;
        this.diagnosticosFiltrados = data;
        this.buscarMascotaFiltrada();
      },
      error: (err: any) => console.error('Error al cargar:', err)
    });
  }

  cargarMascotas(): void {
    this.mascotaService.obtenerMascotas().subscribe({
      next: data => {},
      error: () => console.error('Error al cargar mascotas')
    });
  }

  toggleFormulario(): void {
    this.mostrarFormulario = !this.mostrarFormulario;
  }

  aplicarFiltros(): void {
    this.diagnosticosFiltrados = this.diagnosticos.filter(d =>
      !this.filtroMascota || d.mascota?.id?.toString().includes(this.filtroMascota)
    );
  }

  buscarMascotaFiltrada(): void {
    const id = parseInt(this.filtroMascota, 10);
    if (!isNaN(id)) {
      const encontrado = this.diagnosticos.find(d => d.mascota?.id === id);
      this.mascotaFiltrada = encontrado ? encontrado.mascota : null;
    } else {
      this.mascotaFiltrada = null;
    }
    this.aplicarFiltros();
  }

  guardarDiagnostico(): void {
    if (this.modoEdicion && this.idEditando !== null) {
      this.diagnosticoService.actualizarDiagnostico(this.idEditando, this.nuevoDiagnostico).subscribe({
        next: () => {
          this.cargarDiagnosticos();
          this.cancelarEdicion();
          alert('Diagnóstico actualizado.');
        },
        error: () => alert('Error al actualizar.')
      });
    } else {
      this.diagnosticoService.crearDiagnostico(this.nuevoDiagnostico).subscribe({
        next: (res: any) => {
          this.diagnosticos.push(res.diagnostico);
          this.diagnosticosFiltrados = this.diagnosticos;
          this.cancelarEdicion();
          alert('Diagnóstico registrado.');
        },
        error: () => alert('Error al registrar.')
      });
    }
  }

  cancelarEdicion(): void {
    this.modoEdicion = false;
    this.idEditando = null;
    this.nuevoDiagnostico = {
      titulo: '',
      descripcion: '',
      fecha: '',
      mascota_id: ''
    };
  }

  editarDiagnostico(d: any): void {
    this.modoEdicion = true;
    this.idEditando = d.id;
    this.nuevoDiagnostico = { ...d };
    if (!this.mostrarFormulario) this.toggleFormulario();
  }

  eliminarDiagnostico(id: number): void {
    if (confirm('¿Eliminar este diagnóstico?')) {
      this.diagnosticoService.eliminarDiagnostico(id).subscribe({
        next: () => {
          this.diagnosticos = this.diagnosticos.filter(d => d.id !== id);
          this.aplicarFiltros();
          alert('Diagnóstico eliminado.');
        },
        error: () => alert('Error al eliminar.')
      });
    }
  }
}
