import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TratamientoService {
  private apiUrl = 'http://localhost:8000/api/tratamientos';

  constructor(private http: HttpClient) {}

  private getHeaders() {
    const token = localStorage.getItem('token') || '';
    return {
      headers: new HttpHeaders({
        'Authorization': `Bearer ${token}`
      })
    };
  }

  obtenerTratamientos(): Observable<any> {
    return this.http.get(this.apiUrl, this.getHeaders());
  }

  crearTratamiento(data: any): Observable<any> {
    return this.http.post(this.apiUrl, data, this.getHeaders());
  }

  actualizarTratamiento(id: number, data: any): Observable<any> {
    return this.http.put(`${this.apiUrl}/${id}`, data, this.getHeaders());
  }

  eliminarTratamiento(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${id}`, this.getHeaders());
  }

  obtenerPorMascota(mascotaId: number): Observable<any> {
    return this.http.get(`${this.apiUrl}/mascota/${mascotaId}`, this.getHeaders());
  }

  obtenerTodos(): Observable<any> {
    return this.http.get(this.apiUrl, this.getHeaders());
  }
  
}
