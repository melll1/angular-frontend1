import { Component } from '@angular/core';
import { RouterModule, Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { AuthService } from '../services/auth.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';

@Component({
  selector: 'app-perfiles',
  standalone: true,
  imports: [CommonModule,RouterModule,MatCardModule, MatButtonModule],
  templateUrl: './perfiles.component.html',
})
export class PerfilesComponent {
  user: any;
  role: string = '';
  usuario: any = {};
  mascotas: any[] = [];
  mascotaSeleccionada: any = null; // 🐶 Guarda la mascota a la que se le cambiará la foto


  constructor(private authService: AuthService, private router: Router, private http: HttpClient) {
    const nav = this.router.getCurrentNavigation();
    this.user = nav?.extras.state?.['user'];
    this.role = this.user?.role || '';
  }


  ngOnInit(): void {
    // ✔ Recuperar usuario desde el backend usando el token guardado
    this.authService.obtenerPerfil().subscribe({
      next: (data) => {
        this.usuario = data;
        this.role = data.role;

      // Solo cargamos mascotas si el usuario es dueño
      if (this.role === 'dueno') {
        this.cargarMascotas();
      }
      },
      error: (err) => {
        console.error('No autenticado. Redirigiendo...');
        this.router.navigate(['/login']); // 🔒 si no está autenticado
      }
    });
  }
// 🔐 Cerrar sesión
onLogout() {
  const token = localStorage.getItem('token');

  const headers = new HttpHeaders({
    'Authorization': `Bearer ${token}`
  });

  this.http.post('http://localhost:8000/api/logout', {}, { headers })
    .subscribe({
      next: () => {
        alert('Sesión cerrada');
        localStorage.removeItem('token');
        this.router.navigate(['/login']);
      },
      error: (err) => {
        console.error('Error al cerrar sesión', err);
        alert('No se pudo cerrar sesión.');
      }
    });
}
irARegistro() {
  this.router.navigate(['/registro-mascota']);
}

irALista() {
  this.router.navigate(['/lista-mascotas']);
}

historialMedico(){
  this.router.navigate(['/historial-medico']);
}

// Cargar las mascotas del dueño autenticado
cargarMascotas() {
  const token = localStorage.getItem('token');
  const headers = new HttpHeaders({ Authorization: `Bearer ${token}` });

  this.http.get<any[]>('http://localhost:8000/api/mascotas', { headers })
    .subscribe((res) => {
      // Añade una propiedad extra para manejar mostrar/ocultar detalles
      this.mascotas = res.map(m => ({ ...m, mostrarDetalles: false }));
    });
}

// Alternar la visibilidad de detalles de una mascota
toggleDetalles(mascota: any) {
  mascota.mostrarDetalles = !mascota.mostrarDetalles;
}

// Obtener la URL de la imagen de la mascota
obtenerUrlImagen(path: string): string {
  // ✅ Añadimos el prefijo 'mascotas/' manualmente si existe el path
  return path ? `http://localhost:8000/storage/mascotas/${path}` : 'https://via.placeholder.com/200x150?text=Mascota';
}
// 🔧 Seleccionar mascota para cambiar foto
  seleccionarMascota(mascota: any) {
    this.mascotaSeleccionada = mascota;
  }

  // 📤 Subir nueva imagen para la mascota seleccionada
  subirNuevaFoto(event: any) {
  const file = event.target.files[0];

  if (!file || !this.mascotaSeleccionada) return;

  const formData = new FormData();
  formData.append('foto', file); // 📷 solo mandamos la imagen
  formData.append('_method', 'PUT'); // Laravel necesita esto para update con POST

  const token = localStorage.getItem('token');
  const headers = {
    'Authorization': `Bearer ${token}`
  };

  this.http.post(`http://localhost:8000/api/mascotas/${this.mascotaSeleccionada.id}`, formData, { headers })
    .subscribe({
      next: () => {
        alert('Foto actualizada correctamente');
        this.obtenerMascotasDelDueno(); // 🔄 refrescar
        this.mascotaSeleccionada = null; // ✅ limpiar selección
      },
      error: (err) => {
        console.error('Error al subir imagen', err);
        alert('No se pudo actualizar la foto.');
      }
    });
}
  // 🔄 Obtener mascotas del dueño autenticado
  obtenerMascotasDelDueno() {
    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({ Authorization: `Bearer ${token}` });

    this.http.get<any[]>('http://localhost:8000/api/mascotas', { headers })
      .subscribe((res) => {
        this.mascotas = res.map(m => ({ ...m, mostrarDetalles: false }));
      });
  }
}