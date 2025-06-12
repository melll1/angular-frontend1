import { Component, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { CalendarOptions } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import { FullCalendarModule } from '@fullcalendar/angular';
import { NgbModal, NgbModalRef, NgbModalModule } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-calendario',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    HttpClientModule,
    FullCalendarModule,
    NgbModalModule
  ],
  templateUrl: './calendario.component.html',
  styleUrls: ['./calendario.component.css']
})
export class CalendarioComponent implements OnInit {
  calendarOptions!: CalendarOptions;

  fechaSeleccionada: string = '';
  resultados: any[] = [];
  busqueda: string = '';
  mascotaSeleccionada: any = null;
  motivo: string = '';
  modalRef?: NgbModalRef;
    horaSeleccionada: string = '00:00';


  @ViewChild('modalTemplate', { static: true }) modalTemplate!: TemplateRef<any>;

  constructor(private http: HttpClient, private modalService: NgbModal) {}

  ngOnInit(): void {
    this.calendarOptions = {
      plugins: [dayGridPlugin, interactionPlugin],
      initialView: 'dayGridMonth',
      dateClick: this.onDateClick.bind(this),
      events: (fetchInfo, successCallback, failureCallback) => {
        this.cargarEventos(successCallback, failureCallback);
      }
    };
  }

  onDateClick(arg: any): void {
    this.fechaSeleccionada = arg.dateStr;
    if (this.modalRef) this.modalRef.close();
    this.modalRef = this.modalService.open(this.modalTemplate);
  }

  buscarMascotas(): void {
    if (this.busqueda.trim().length < 2) return;
    const token = localStorage.getItem('token') || '';
    this.http.get<any[]>(
      `http://localhost:8000/api/mascotas/buscar-avanzado?query=${this.busqueda}`,
      { headers: { Authorization: `Bearer ${token}` } }
    ).subscribe({
      next: res => this.resultados = res,
      error: err => console.error('Error al buscar mascotas', err)
    });
  }

  seleccionarMascota(m: any): void {
    this.mascotaSeleccionada = m;
    this.resultados = [];
    this.busqueda = '';
  }

  crearCita(): void {
     if (!this.mascotaSeleccionada || !this.fechaSeleccionada || !this.horaSeleccionada){
      alert('Completa todos los campos');
      return;
    }
    const fechaHoraCompleta = `${this.fechaSeleccionada}T${this.horaSeleccionada}`;

    const token = localStorage.getItem('token') || '';
    const body = {
   mascota_id: this.mascotaSeleccionada.id,
  dueno_id: this.mascotaSeleccionada.usuario?.id,
  veterinario_id: this.mascotaSeleccionada.veterinario_asignado?.veterinario_id,

  fecha_hora: fechaHoraCompleta,
  motivo: this.motivo
};

    this.http.post('http://localhost:8000/api/citas', body,
      { headers: { Authorization: `Bearer ${token}` } }
    ).subscribe({
      next: () => {
        alert('Cita creada con éxito');
        this.modalRef?.close();
        this.resetForm();
        this.refrescarEventos(); // Refrescar calendario
      },
      error: err => {
        console.error('Error al crear cita', err);
        alert('Error al crear cita');
      }
    });
  }

  cargarEventos(successCallback: Function, failureCallback: Function): void {
    const token = localStorage.getItem('token') || '';
    this.http.get<any[]>('http://localhost:8000/api/citas', {
      headers: { Authorization: `Bearer ${token}` }
    }).subscribe({
      next: (citas) => {
        const eventos = citas.map(cita => ({
          title: `${cita.mascota?.nombre} - ${cita.motivo || 'Sin motivo'}`,
          start: cita.fecha_hora
        }));
        successCallback(eventos);
      },
      error: (err) => {
        console.error('Error al cargar eventos', err);
        failureCallback(err);
      }
    });
  }

  cerrarModal(): void {
    this.modalRef?.dismiss();
    this.resetForm();
  }

  private resetForm(): void {
    this.fechaSeleccionada = '';
    this.mascotaSeleccionada = null;
    this.motivo = '';
    this.resultados = [];
    this.busqueda = '';
  }

  private refrescarEventos(): void {
    if (this.calendarOptions.events && typeof this.calendarOptions.events === 'function') {
      (this.calendarOptions.events as Function)(
        {}, () => {}, () => {}
      );
    }
  }
}
