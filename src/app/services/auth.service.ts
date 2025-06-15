import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private apiUrl = 'http://localhost:8000/api';
  private currentUser: any = null;

  constructor(private http: HttpClient) {}

  getCsrfCookie(): Observable<void> {
    return this.http.get<void>('http://localhost:8000/sanctum/csrf-cookie', { withCredentials: true });
  }

  login(credentials: { email: string; password: string }, verified = false): Observable<any> {
    const url = `${this.apiUrl}/login`;
    const params = verified ? new HttpParams().set('verified', '1') : undefined;

    return this.http.post(url, credentials, {
      params,
      withCredentials: true
    });
  }

  register(userData: {
    name: string;
    email: string;
    password: string;
    password_confirmation: string;
    telefono: string;
    role: string;
  }): Observable<any> {
    return this.http.post(`${this.apiUrl}/register`, userData, { withCredentials: true });
  }

  resendVerificationEmail(): Observable<any> {
    return this.http.post(`${this.apiUrl}/email/verification-notification`, {}, { withCredentials: true });
  }

  logout(): Observable<any> {
  return this.http.post('http://localhost:8000/api/logout', {}, { withCredentials: true });
}

// ✅ Método para obtener los datos del usuario logueado
obtenerPerfil(): Observable<any> {
  const token = localStorage.getItem('token');
  const headers = new HttpHeaders({
    'Authorization': `Bearer ${token}`
  });

  return this.http.get('http://localhost:8000/api/user-profile', { headers });
}

// ✅ Getter público para acceder al usuario actual
  getUsuarioActual(): any {
    return this.currentUser;
  }

  // ✅ También mantenemos este getter de ID
  getCurrentUserId(): number {
    return this.currentUser?.id ?? 0;
  }

  // ✅ Podés usar esto para establecer el usuario después del login
  setUsuarioActual(user: any): void {
    this.currentUser = user;
    localStorage.setItem('currentUser', JSON.stringify(user));
  }

}
