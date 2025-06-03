import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';


@Injectable({
  providedIn: 'root'
})
export class MascotasService {
  private apiUrl = 'http://localhost:8000/api/mascotas'; // Asegúrate que esta ruta coincida con tu backend

  constructor(private http: HttpClient) {}

    // 👉 Devuelve los headers con el token JWT para enviar en cada petición protegida
  private getAuthHeaders() {
    const token = localStorage.getItem('token');
    return new HttpHeaders({
      Authorization: `Bearer ${token}`
    });
  }


  // Método para crear una mascota, acepta también archivos (foto) usando FormData
crearMascota(data: FormData): Observable<any> {
  const token = localStorage.getItem('token');

  // No pongas 'Content-Type': multipart/form-data aquí manualmente
  // Angular lo hace automáticamente al usar FormData
  const headers = new HttpHeaders({
    Authorization: `Bearer ${token}`
  });

  return this.http.post(this.apiUrl, data, { headers });
}

  

  obtenerMascotas(): Observable<any> {
  const token = localStorage.getItem('token');
  const headers = new HttpHeaders({
    'Authorization': `Bearer ${token}`
  });

  return this.http.get(this.apiUrl, { headers });
}


// ❌ Antes no se incluían los headers — eso causaba el error 401
  // ✅ Ahora incluye el token para autenticar la eliminación
  // 🔥 Método para eliminar una mascota con token en los headers
  eliminarMascota(id: number): Observable<any> {
  const token = localStorage.getItem('token'); // ⛽️ Traemos el token del login

  const headers = new HttpHeaders({
    Authorization: `Bearer ${token}`, // ✅ Lo enviamos como header
  });

  // ✅ La URL ya tiene "mascotas", no lo repitas
  return this.http.delete(`${this.apiUrl}/${id}`, { headers });
}




// 🔄 Actualizar los datos de una mascota
actualizarMascota(id: number, data: any): Observable<any> {
  const token = localStorage.getItem('token');
  const headers = new HttpHeaders({
    'Authorization': `Bearer ${token}`
  });

  return this.http.put(`${this.apiUrl}/${id}`, data, { headers });
}


}


