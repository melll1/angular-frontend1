import { AfterViewInit, Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MascotasService } from '../../services/mascotas.service';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Router } from '@angular/router';

declare const M: any;
@Component({
  selector: 'app-registro-mascota',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './registro-mascota.component.html',
})
export class RegistroMascotaComponent {

   // Propiedades del formulario
  nombre = '';
  especie = '';
  raza = '';
  edad = 0;
  sexo = '';
  fechaNacimiento: string = '';
  microchip = '';
  color = '';
   esterilizado: boolean | null = null;
  descripcion = '';
  fotoSeleccionada: File | null = null;
  errores: any = {};

  // Para buscador de usuario
  terminoBusqueda = '';
  resultadosBusqueda: any[] = [];
  usuarioSeleccionado: any = null;

  constructor(
    private mascotasService: MascotasService,
    private http: HttpClient,
    private router: Router
  ) {}
  volver(): void {
  this.router.navigate(['/lista-mascotas']); 
}

  ngAfterViewInit() {
    const elems = document.querySelectorAll('select');
    M.FormSelect.init(elems);
  }

  
buscarUsuarios() {
    if (this.terminoBusqueda.length < 2) {
      this.resultadosBusqueda = [];
      return;
    }

    const token = localStorage.getItem('token');
    const headers = new HttpHeaders({
      Authorization: `Bearer ${token}`,
    });

    this.http
      .get<any[]>(`http://localhost:8000/api/buscar-usuarios?query=${this.terminoBusqueda}`, { headers })
      .subscribe((usuarios) => {
        this.resultadosBusqueda = usuarios;
      });
  }
 // Seleccionar dueño desde los resultados
  seleccionarUsuario(usuario: any) {
    this.usuarioSeleccionado = usuario;
    this.resultadosBusqueda = [];
    this.terminoBusqueda = usuario.name;
  }
  
  // Maneja el archivo seleccionado
  onFotoSeleccionada(event: any): void {
    const file = event.target.files[0];
    if (file) {
      this.fotoSeleccionada = file;
    }
  }
 // Enviar formulario
  registrarMascota() {
    // Reinicia errores
    this.errores = {};

    // Validaciones mínimas
    if (!this.nombre) this.errores.nombre = 'El nombre es obligatorio';
    if (!this.especie) this.errores.especie = 'La especie es obligatoria';
    if (!this.raza) this.errores.raza = 'La raza es obligatoria';
    if (this.edad < 0) this.errores.edad = 'Edad no válida';
    if (!this.sexo) this.errores.sexo = 'El sexo es obligatorio';

    if (Object.keys(this.errores).length > 0) return;

    // Usa FormData para enviar datos incluyendo archivos
    // Validaciones básicas
    if (!this.nombre) this.errores.nombre = 'El nombre es obligatorio';
    if (!this.especie) this.errores.especie = 'La especie es obligatoria';
    if (!this.raza) this.errores.raza = 'La raza es obligatoria';
    if (this.edad === null || this.edad < 0) this.errores.edad = 'Edad no válida';
    if (!this.sexo) this.errores.sexo = 'Selecciona el sexo';
    if (!this.fechaNacimiento) this.errores.fecha_nacimiento = 'La fecha de nacimiento es obligatoria';
    if (!this.microchip) this.errores.microchip = 'El número de microchip es obligatorio';
    if (!this.color) this.errores.color = 'El color es obligatorio';
    if (this.esterilizado === null) this.errores.esterilizado = 'Selecciona si está esterilizado';
    if (!this.usuarioSeleccionado) this.errores.usuario = 'Selecciona un dueño';

    if (Object.keys(this.errores).length > 0) return;

    // FormData para enviar imagen + texto
    const formData = new FormData();
    formData.append('nombre', this.nombre);
    formData.append('especie', this.especie);
    formData.append('raza', this.raza);
    formData.append('edad', this.edad?.toString() ?? '');
    formData.append('sexo', this.sexo);
    formData.append('fecha_nacimiento', this.fechaNacimiento);
    formData.append('microchip', this.microchip);
    formData.append('color', this.color);
    formData.append('esterilizado', this.esterilizado ? '1' : '0');
    formData.append('user_id', this.usuarioSeleccionado.id); // Asocia con el dueño
    if (this.fotoSeleccionada) {
      formData.append('foto', this.fotoSeleccionada);
    }

    this.mascotasService.crearMascota(formData).subscribe({
      next: (res: any) => {
        alert('🐶 Mascota registrada exitosamente');
        // Limpieza de todos los campos del formulario
this.nombre = '';
this.especie = '';
this.raza = '';
this.edad = 0;
this.sexo = '';
this.fechaNacimiento = '';
this.microchip = '';
this.color = '';
this.esterilizado = null;
this.descripcion = '';
this.fotoSeleccionada = null;

// Limpieza del buscador de usuario
this.usuarioSeleccionado = null;
this.terminoBusqueda = '';
this.resultadosBusqueda = [];

// Limpiar campo de imagen si es necesario
const inputFile = document.getElementById('foto') as HTMLInputElement;
if (inputFile) inputFile.value = '';

// 🔁 Vuelve a inicializar Materialize para que detecte el reset de los <select>
setTimeout(() => {
  const elems = document.querySelectorAll('select');
  M.FormSelect.init(elems);
}, 100);
  
    this.errores = {};
      },
      error: (err: any) => {
        alert('❌ Error al registrar la mascota');
        console.error(err);
      }
    });
  }


}
