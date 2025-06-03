import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class VacunaService {
  private apiUrl = 'http://localhost:8000/api/vacunas';
  private historialBaseUrl = 'http://localhost:8000/api/historiales';

  constructor(private http: HttpClient) {}

  private getHeaders() {
    const token = localStorage.getItem('token');
    return {
      headers: new HttpHeaders({
        'Authorization': `Bearer ${token}`
      })
    };
  }

  // Vacunas
  obtenerVacunas() {
    return this.http.get(this.apiUrl, this.getHeaders());
  }

  crearVacuna(data: any) {
    return this.http.post(this.apiUrl, data, this.getHeaders());
  }

  actualizarVacuna(id: number, data: any) {
    return this.http.put(`${this.apiUrl}/${id}`, data, this.getHeaders());
  }

  eliminarVacuna(id: number) {
    return this.http.delete(`${this.apiUrl}/${id}`, this.getHeaders());
  }

  buscarVacunaPorNombreYFecha(mascota_id: number, nombre: string, fecha_aplicacion: string) {
    return this.http.get(`${this.apiUrl}/buscar`, {
      params: {
        mascota_id: mascota_id.toString(),
        nombre,
        fecha_aplicacion
      },
      ...this.getHeaders()
    });
  }

  // Historial vinculado a vacunas
  buscarHistorialRelacionado(mascotaId: number, fecha: string) {
    return this.http.get(`${this.historialBaseUrl}/buscar?mascota_id=${mascotaId}&fecha=${fecha}&tipo=Vacuna`, this.getHeaders());
  }

  obtenerHistorialPorVacuna(vacunaId: number) {
    return this.http.get(`${this.historialBaseUrl}/vacuna/${vacunaId}`, this.getHeaders());
  }

  actualizarHistorial(id: number, datos: any) {
    return this.http.put(`${this.historialBaseUrl}/${id}`, datos, this.getHeaders());
  }

  actualizarHistorialPorVacunaId(vacunaId: number, data: any) {
    return this.http.put(`${this.historialBaseUrl}/por-vacuna/${vacunaId}`, data, this.getHeaders());
  }

  crearHistorial(data: any) {
    return this.http.post(`${this.historialBaseUrl}`, data, this.getHeaders());
  }
}
