import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MensajeriaService {
  private apiUrl = 'http://localhost:8000/api'; // Asegúrate de que coincida con tu backend

  constructor(private http: HttpClient) {}

  private getAuthHeaders(): HttpHeaders {
    const token = localStorage.getItem('token');
    return new HttpHeaders({
      Authorization: `Bearer ${token}`
    });
  }

  /**
   * Obtiene todos los mensajes asociados a una mascota para el usuario autenticado.
   */
  obtenerMensajesPorMascota(mascotaId: number): Observable<any[]> {
    return this.http.get<any[]>(`${this.apiUrl}/mensajes/${mascotaId}`, {
      headers: this.getAuthHeaders()
    });
  }

  /**
   * Envía un nuevo mensaje para una mascota y un receptor.
   */
  enviarMensaje(payload: {
    mascota_id: number;
    receptor_id: number;
    contenido: string;
  }): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/mensajes`, payload, {
      headers: this.getAuthHeaders()
    });
  }
}
