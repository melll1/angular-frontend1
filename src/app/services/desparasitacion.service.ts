import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DesparasitacionService {
  private apiUrl = 'http://localhost:8000/api/desparasitaciones';

  constructor(private http: HttpClient) {}

  private getHeaders() {
    const token = localStorage.getItem('token');
    return {
      headers: new HttpHeaders({
        'Authorization': `Bearer ${token}`
      })
    };
  }

  // Obtener todas las desparasitaciones
  obtenerDesparasitaciones(): Observable<any> {
    return this.http.get(this.apiUrl, this.getHeaders());
  }

  // Crear una nueva desparasitación
  crearDesparasitacion(data: any): Observable<any> {
    
    return this.http.post(this.apiUrl, data, this.getHeaders());
  }
  // ✏️ Actualizar una desparasitación existente
  actualizarDesparasitacion(id: number, data: any): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}`, data, this.getHeaders());
  }

  // ❌ Eliminar una desparasitación
  eliminarDesparasitacion(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${id}`, this.getHeaders());
  }

  // 🔍 Buscar por mascota
  obtenerPorMascota(mascotaId: number): Observable<any> {
    return this.http.get(`${this.apiUrl}/mascota/${mascotaId}`, this.getHeaders());
  }

  crearHistorial(data: any) {
  return this.http.post('http://localhost:8000/api/historiales', data, this.getHeaders());
}

}
