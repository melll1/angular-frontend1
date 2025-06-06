import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DiagnosticoService {
  private apiUrl = 'http://localhost:8000/api/diagnosticos';

  constructor(private http: HttpClient) {}

  private getHeaders() {
    const token = localStorage.getItem('token') || '';
    return {
      headers: new HttpHeaders({
        'Authorization': `Bearer ${token}`
      })
    };
  }

  obtenerDiagnosticos(): Observable<any> {
    return this.http.get(this.apiUrl, this.getHeaders());
  }

  crearDiagnostico(data: any): Observable<any> {
    return this.http.post(this.apiUrl, data, this.getHeaders());
  }

  actualizarDiagnostico(id: number, data: any): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}`, data, this.getHeaders());
  }

  eliminarDiagnostico(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${id}`, this.getHeaders());
  }

  obtenerPorMascota(mascotaId: number): Observable<any> {
    return this.http.get(`${this.apiUrl}/mascota/${mascotaId}`, this.getHeaders());
  }

  crearHistorial(data: any) {
  return this.http.post('http://localhost:8000/api/historiales', data, this.getHeaders());
}
}
