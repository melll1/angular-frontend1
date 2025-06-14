import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MensajesService {
  private apiUrl = 'http://localhost:8000/api';

  constructor(private http: HttpClient) {}

  private getAuthHeaders(): HttpHeaders {
    const token = localStorage.getItem('token');
    return new HttpHeaders({
      Authorization: `Bearer ${token}`
    });
  }

  /**
   * Obtiene las conversaciones activas del usuario autenticado.
   */
  obtenerConversaciones(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/mensajes/conversaciones`, {
      headers: this.getAuthHeaders()
    });
  }

  /**
   * Obtiene las mascotas que tienen asignado un paseador pero aún no tienen conversación.
   */
  obtenerMascotasSinChat(): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/mensajes/mascotas-sin-chat`, {
      headers: this.getAuthHeaders()
    });
  }
}
