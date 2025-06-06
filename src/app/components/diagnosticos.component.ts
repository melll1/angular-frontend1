import { Component, OnInit, AfterViewInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { ActivatedRoute, Router } from '@angular/router';
import { DiagnosticoService } from '../services/diagnostico.service';

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
  nuevoDiagnostico: any = {
    titulo: '',
    descripcion: '',
    fecha: '',
    mascota_id: ''
  };

  modoEdicion: boolean = false;
  idEditando: number | null = null;
  desdeHistorial: boolean = false;

  constructor(
    private diagnosticoService: DiagnosticoService,
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
    descripcion: params['descripcion'] || '',
    fecha: params['fecha'] || '',
    mascota_id: Number(params['mascota_id']) || ''
  };
  this.desdeHistorial = true;
}
else if (params['mascota_id'] && params['fecha'] && params['descripcion']) {
      this.nuevoDiagnostico = {
        descripcion: params['descripcion'],
        fecha: params['fecha'],
        mascota_id: +params['mascota_id']
      };
      this.desdeHistorial = true;
    }
  });

  this.cargarDiagnosticos();
}


  cargarDiagnosticos(): void {
    this.diagnosticoService.obtenerDiagnosticos().subscribe({
      next: (data: any) => this.diagnosticos = data,
      error: (err: any) => console.error('Error al cargar:', err)
    });
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
          alert('Diagnóstico registrado.');
          this.limpiarFormulario();
          this.diagnosticos.push(res.diagnostico);
        },
        error: () => alert('Error al registrar.')
      });
    }
  }

  limpiarFormulario(): void {
    this.nuevoDiagnostico = {
      titulo: '',
      descripcion: '',
      fecha: '',
      mascota_id: ''
    };
    this.modoEdicion = false;
    this.idEditando = null;
  }

  editarDiagnostico(diagnostico: any): void {
    this.modoEdicion = true;
    this.idEditando = diagnostico.id;
    this.nuevoDiagnostico = { ...diagnostico };
  }

  cancelarEdicion(): void {
    this.limpiarFormulario();
  }

  eliminarDiagnostico(id: number): void {
    if (confirm('¿Eliminar este diagnóstico?')) {
      this.diagnosticoService.eliminarDiagnostico(id).subscribe({
        next: () => {
          this.diagnosticos = this.diagnosticos.filter(d => d.id !== id);
          alert('Diagnóstico eliminado.');
        },
        error: () => alert('Error al eliminar.')
      });
    }
  }
}
