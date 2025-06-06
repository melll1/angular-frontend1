import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class HistorialService {
  
  private apiUrl = 'http://localhost:8000/api/historiales'; // Ruta base del backend

  constructor(private http: HttpClient) {}
  
  // 📌 Genera los headers con el token de autenticación
  private getAuthHeaders(): HttpHeaders {
    const token = localStorage.getItem('token') || '';
    return new HttpHeaders({ Authorization: `Bearer ${token}` });
  }

  // 🔍 Obtener todos los historiales médicos
obtenerHistoriales(): Observable<any> {
  return this.http.get(this.apiUrl, {
    headers: this.getAuthHeaders()
  });
}

  // 🔄 Obtener historial médico de una mascota por su ID
  obtenerHistorialesDeMascota(mascotaId: number): Observable<any> {
    return this.http.get(`${this.apiUrl}/mascota/${mascotaId}`, {
      headers: this.getAuthHeaders()
    });
  }

  // 📝 Crear nuevo historial médico para una mascota
  crearHistorial(data: any): Observable<any> {
    return this.http.post(this.apiUrl, data, {
      headers: this.getAuthHeaders()
    });
  }


  // ✏️ Editar un historial médico existente
 actualizarHistorial(id: number, data: any): Observable<any> {
  return this.http.put(`http://localhost:8000/api/historial/${id}`, data, {
    headers: this.getAuthHeaders()
  });
}
 // ❌ Eliminar historial
  eliminarHistorial(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${id}`, {
      headers: this.getAuthHeaders()
    });
  }
  
}
