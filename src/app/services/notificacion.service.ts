import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { tap } from 'rxjs/operators';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class NotificacionService {
  private baseUrl = 'http://localhost:8000/api/notificaciones';

  private contadorSubject = new BehaviorSubject<number>(0);
  contador$ = this.contadorSubject.asObservable();


  constructor(private http: HttpClient) {}
  private getAuthHeaders(): HttpHeaders {
    const token = localStorage.getItem('token');
    return new HttpHeaders({
      Authorization: `Bearer ${token}`
    });
  }

 obtenerNotificaciones(): Observable<any[]> {
  return this.http.get<any[]>(this.baseUrl, {
    headers: this.getAuthHeaders()
  }).pipe(
    tap(n => this.contadorSubject.next(n.filter(x => !x.leido).length))
  );
}

  marcarComoLeida(id: number): Observable<any> {
    return this.http.put(`${this.baseUrl}/${id}`, {}, {
      headers: this.getAuthHeaders()
    }).pipe(
      tap(() => this.actualizarContador())
    );
  }

  marcarTodasLeidas(): Observable<any> {
  return this.http.post(`${this.baseUrl}/marcar-todas`, {}, {
    headers: this.getAuthHeaders()
  }).pipe(
    tap(() => {
      // Aquí puedes actualizar el contador manualmente si es necesario
      this.contadorSubject.next(0); // Restablece el contador si todas las notificaciones se marcan como leídas
    })
  );
}

  actualizarContador(): void {
    this.obtenerNotificaciones().subscribe(); // Fuerza la actualización del contador
  }

  responderCita(citaId: number, estado: string, notificacionId: number): Observable<any> {
  return this.http.patch(`http://localhost:8000/api/citas/${citaId}/responder`, { estado }, {
    headers: this.getAuthHeaders()
  }).pipe(
    tap(() => this.marcarComoLeida(notificacionId).subscribe())
  );
}

}
