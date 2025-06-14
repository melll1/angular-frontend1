import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet, RouterModule } from '@angular/router';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatListModule } from '@angular/material/list';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { BreakpointObserver, LayoutModule } from '@angular/cdk/layout'; // 👈 necesario
import { NotificacionService } from '../../services/notificacion.service';


@Component({
  selector: 'app-layout',
  standalone: true,
  imports: [
    CommonModule,
    RouterModule,
    RouterOutlet,
    MatSidenavModule,
    MatToolbarModule,
    MatListModule,
    MatIconModule,
    MatButtonModule,
    LayoutModule // 👈 necesario
  ],
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.css']
})
export class LayoutComponent implements OnInit {
  sidebarAbierto = true;
  modoSidenav: 'over' | 'side' = 'side';
  notificacionesNoLeidas = 0;
  rol: string = '';


  ngOnInit(): void {
  const roleData = localStorage.getItem('role');
  if (roleData) {
    this.rol = roleData;
  }
}

mostrarMensajes(): boolean {
  return this.rol === 'dueno' || this.rol === 'paseador';
}

  constructor(private breakpointObserver: BreakpointObserver, private notificacionService: NotificacionService) {
    this.breakpointObserver.observe(['(max-width: 768px)']).subscribe(result => {
      this.modoSidenav = result.matches ? 'over' : 'side';
      this.sidebarAbierto = !result.matches;
    });
     this.notificacionService.contador$.subscribe(c => {
    this.notificacionesNoLeidas = c;
  });
  }

  obtenerContadorNotificaciones(): void {
    this.notificacionService.obtenerNotificaciones().subscribe({
    next: (notificaciones: any[]) => {
      this.notificacionesNoLeidas = notificaciones.filter(n => !n.leido).length;
    },
    error: () => {
      this.notificacionesNoLeidas = 0;
    }
  });
  }

  toggleSidebar(): void {
    this.sidebarAbierto = !this.sidebarAbierto;
  }

  cerrarSiEsOver(): void {
  if (this.modoSidenav === 'over') {
    this.sidebarAbierto = false;
  }
}
  abrirSiEsOver(): void {
    if (this.modoSidenav === 'over') {
      this.sidebarAbierto = true;
    }
  }
}
