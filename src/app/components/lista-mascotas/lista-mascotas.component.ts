import { Component, OnInit } from '@angular/core';
import { MascotasService } from '../../services/mascotas.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';


@Component({
  selector: 'app-lista-mascotas',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './lista-mascotas.component.html',
  styleUrls: ['./lista-mascotas.component.css']
})
export class ListaMascotasComponent implements OnInit {
  // 🐾 Propiedades
  todasLasMascotas: any[] = []; // Lista completa para búsqueda
  mascotas: any[] = [];         // Lista filtrada (la visible)
  mascotaSeleccionada: any = null;
  modoEdicion: boolean = false;
  terminoBusqueda: string = ''; // 🔍 Campo de búsqueda
  role: string = '';
  foto: File | null = null;

  constructor(private mascotasService: MascotasService, private router: Router, private http: HttpClient) {}



  ngOnInit(): void {
  const roleData = localStorage.getItem('role');
  if (roleData) {
    this.role = roleData; // Ya es un string plano, no usar JSON.parse
  }

  this.cargarMascotas();
}

  // ✅ Carga mascotas y guarda copia original
  cargarMascotas(): void {
    this.mascotasService.obtenerMascotas().subscribe(
      (res) => {
        this.todasLasMascotas = res; // Copia total
        this.mascotas = res;         // Copia filtrada
      },
      (err) => {
        console.error('Error al obtener mascotas:', err);
      }
    );
  }

  // 🧹 Elimina una mascota
  eliminarMascota(id: number): void {
    if (confirm('¿Estás seguro de que deseas eliminar esta mascota?')) {
      this.mascotasService.eliminarMascota(id).subscribe({
        next: () => {
          this.mascotas = this.mascotas.filter(m => m.id !== id);
          alert('Mascota eliminada con éxito');
        },
        error: (error) => {
          console.error('Error al eliminar la mascota:', error);
          alert('No se pudo eliminar la mascota');
        }
      });
    }
  }

  // 🖊️ Edición
  iniciarEdicion(mascota: any): void {
    this.mascotaSeleccionada = { ...mascota };
    this.modoEdicion = true;
  }

  cancelarEdicion(): void {
    this.mascotaSeleccionada = null;
    this.modoEdicion = false;
  }

  guardarCambios(): void {
  if (!this.mascotaSeleccionada) return;

  const formData = new FormData();
  formData.append('nombre', this.mascotaSeleccionada.nombre);
  formData.append('edad', this.mascotaSeleccionada.edad.toString());
  formData.append('_method', 'PUT'); // Laravel entenderá que es PUT

  if (this.foto) {
    formData.append('foto', this.foto);
  }

  const token = localStorage.getItem('token');
  const headers = {
    Authorization: `Bearer ${token}`
  };

  this.http.post(`http://localhost:8000/api/mascotas/${this.mascotaSeleccionada.id}`, formData, { headers })
    .subscribe({
      next: () => {
        alert('Mascota actualizada');
        this.cargarMascotas();
        this.cancelarEdicion();
      },
      error: (err: any) => {
        console.error('Error al actualizar la mascota:', err);
        alert('No se pudo actualizar la mascota');
      }
    });
}

  // 🔍 Filtro en vivo por nombre mascota, dueño o email
  filtrarMascotas(): void {
    const query = this.terminoBusqueda.toLowerCase();

    this.mascotas = this.todasLasMascotas.filter((mascota) => {
      const nombreMascota = mascota.nombre?.toLowerCase() || '';
      const nombreDueno = mascota.usuario?.name?.toLowerCase() || '';
      const correoDueno = mascota.usuario?.email?.toLowerCase() || '';

      return (
        nombreMascota.includes(query) ||
        nombreDueno.includes(query) ||
        correoDueno.includes(query)
      );
    });
  }

  irARegistro(): void {
  this.router.navigate(['/registro-mascota']);
}

irAlPerfil(): void {
  this.router.navigate(['/perfiles']);
}

onFileSelected(event: any) {
  this.foto = event.target.files[0];
}

verHistorial(mascotaId: number): void {
  // Navega a la ruta /ver-historial/:id
  this.router.navigate(['/historial-medico', mascotaId]);
}

}
