import { Component, ViewEncapsulation } from '@angular/core';
import { RouterModule, Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { AuthService } from '../services/auth.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';

@Component({
  selector: 'app-perfiles',
  standalone: true,
  imports: [CommonModule, RouterModule, MatCardModule, MatButtonModule],
  templateUrl: './perfiles.component.html',
  encapsulation: ViewEncapsulation.None
})
export class PerfilesComponent {
  user: any;
  role: string = '';
  usuario: any = {};
  mascotas: any[] = [];
  mascotaSeleccionada: any = null;
  citasHoy: any[] = [];
  citasManana: any[] = [];

  constructor(private authService: AuthService, private router: Router, private http: HttpClient) {
    const nav = this.router.getCurrentNavigation();
    this.user = nav?.extras.state?.['user'];
    this.role = this.user?.role || '';
  }

  ngOnInit(): void {
    this.authService.obtenerPerfil().subscribe({
      next: (data) => {
        this.usuario = data;
        this.role = data.role;

        if (this.role === 'dueno') {
          this.cargarMascotas();
        } else if (this.role === 'paseador') {
          this.cargarMascotasAsignadas();
        }

        this.obtenerCitasFiltradas();
      },
      error: () => this.router.navigate(['/login'])
    });
  }

  obtenerCitasFiltradas(): void {
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({ Authorization: `Bearer ${token}` });

    this.http.get<any[]>('http://localhost:8000/api/citas', { headers }).subscribe({
      next: (res) => {
        const hoy = '2025-06-11';
        const manana = '2025-06-12';

        if (this.role === 'veterinario') {
          this.citasHoy = res.filter(c => c.fecha_hora.startsWith(hoy));
          this.citasManana = res.filter(c => c.fecha_hora.startsWith(manana));
        } else if (this.role === 'dueno') {
          const idDueno = this.usuario.id;
          this.citasHoy = res.filter(c => c.fecha_hora.startsWith(hoy) && c.dueno_id === idDueno);
          this.citasManana = res.filter(c => c.fecha_hora.startsWith(manana) && c.dueno_id === idDueno);
        }
      },
      error: () => console.error('Error cargando citas')
    });
  }

  cargarMascotas(): void {
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({ Authorization: `Bearer ${token}` });

    this.http.get<any[]>('http://localhost:8000/api/mascotas', { headers }).subscribe({
      next: (res) => {
        this.mascotas = res.map(m => ({ ...m, mostrarDetalles: false }));
      },
      error: () => console.error('Error al cargar mascotas')
    });
  }

  cargarMascotasAsignadas(): void {
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({ Authorization: `Bearer ${token}` });

    this.http.get<any[]>('http://localhost:8000/api/paseador/mascotas-asignadas', { headers }).subscribe({
      next: (res) => {
        this.mascotas = res.map(m => ({ ...m, mostrarDetalles: false }));
      },
      error: () => console.error('Error al cargar mascotas asignadas')
    });
  }

  toggleDetalles(mascota: any): void {
    mascota.mostrarDetalles = !mascota.mostrarDetalles;
  }

  obtenerUrlImagen(path: string): string {
    return path ? `http://localhost:8000/storage/mascotas/${path}` : 'https://via.placeholder.com/200x150?text=Mascota';
  }

  seleccionarMascota(mascota: any): void {
    this.mascotaSeleccionada = mascota;
  }

  subirNuevaFoto(event: any): void {
    const file = event.target.files[0];
    if (!file || !this.mascotaSeleccionada) return;

    const formData = new FormData();
    formData.append('foto', file);
    formData.append('_method', 'PUT');

    const token = localStorage.getItem('token');
    const headers = { 'Authorization': `Bearer ${token}` };

    this.http.post(`http://localhost:8000/api/mascotas/${this.mascotaSeleccionada.id}`, formData, { headers }).subscribe({
      next: () => {
        alert('Foto actualizada correctamente');
        this.obtenerMascotasDelDueno();
        this.mascotaSeleccionada = null;
      },
      error: () => alert('No se pudo actualizar la foto.')
    });
  }

  obtenerMascotasDelDueno(): void {
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({ Authorization: `Bearer ${token}` });

    this.http.get<any[]>('http://localhost:8000/api/mascotas', { headers }).subscribe((res) => {
      this.mascotas = res.map(m => ({ ...m, mostrarDetalles: false }));
    });
  }

  irARegistro(): void {
    this.router.navigate(['/registro-mascota']);
  }

  onLogout(): void {
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({ 'Authorization': `Bearer ${token}` });

    this.http.post('http://localhost:8000/api/logout', {}, { headers }).subscribe({
      next: () => {
        alert('Sesión cerrada');
        localStorage.removeItem('token');
        this.router.navigate(['/login']);
      },
      error: () => alert('No se pudo cerrar sesión.')
    });
  }
}
