import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DiagnosticoService } from '../services/diagnostico.service';
import { ActivatedRoute } from '@angular/router';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-diagnosticos',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './diagnosticos.component.html',
  styleUrls: ['./diagnosticos.component.css']
})
export class DiagnosticosComponent implements OnInit {

  diagnosticos: any[] = [];
  nuevoDiagnostico: any = {
    nombre: '',
    descripcion: '',
    fecha: '',
    mascota_id: null
  };
  modoEdicion: boolean = false;
  idEditando: number | null = null;

  constructor(
    private diagnosticoService: DiagnosticoService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      if (params['mascota_id']) {
        this.nuevoDiagnostico.mascota_id = +params['mascota_id'];
      }
      if (params['editar'] && params['id']) {
        this.modoEdicion = true;
        this.idEditando = +params['id'];
        this.nuevoDiagnostico = {
          nombre: params['nombre'] || '',
          descripcion: params['descripcion'] || '',
          fecha: params['fecha'] || '',
          mascota_id: +params['mascota_id']
        };
      }
    });

    this.cargarDiagnosticos();
  }

  cargarDiagnosticos(): void {
    this.diagnosticoService.obtenerDiagnosticos().subscribe({
      next: (data: any) => this.diagnosticos = data,
      error: (err: any) => console.error('Error cargando diagnósticos:', err)
    });
  }

  guardarDiagnostico(): void {
    if (this.modoEdicion && this.idEditando) {
      this.diagnosticoService.actualizarDiagnostico(this.idEditando, this.nuevoDiagnostico).subscribe({
        next: () => {
          alert('Diagnóstico actualizado');
          this.cargarDiagnosticos();
          this.cancelarEdicion();
        },
        error: () => alert('Error al actualizar diagnóstico')
      });
    } else {
      this.diagnosticoService.crearDiagnostico(this.nuevoDiagnostico).subscribe({
        next: () => {
          alert('Diagnóstico guardado');
          this.cargarDiagnosticos();
          this.nuevoDiagnostico = {
            nombre: '',
            descripcion: '',
            fecha: '',
            mascota_id: this.nuevoDiagnostico.mascota_id
          };
        },
        error: () => alert('Error al guardar diagnóstico')
      });
    }
  }

  editarDiagnostico(diagnostico: any): void {
    this.modoEdicion = true;
    this.idEditando = diagnostico.id;
    this.nuevoDiagnostico = { ...diagnostico };
  }

  cancelarEdicion(): void {
    this.modoEdicion = false;
    this.idEditando = null;
    this.nuevoDiagnostico = {
      nombre: '',
      descripcion: '',
      fecha: '',
      mascota_id: this.nuevoDiagnostico.mascota_id
    };
  }

  eliminarDiagnostico(id: number): void {
    if (confirm('¿Seguro que quieres eliminar este diagnóstico?')) {
      this.diagnosticoService.eliminarDiagnostico(id).subscribe({
        next: () => {
          this.diagnosticos = this.diagnosticos.filter(d => d.id !== id);
          alert('Diagnóstico eliminado');
        },
        error: () => alert('Error al eliminar diagnóstico')
      });
    }
  }
}
