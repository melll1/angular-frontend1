import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet, RouterModule } from '@angular/router';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatListModule } from '@angular/material/list';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { BreakpointObserver, LayoutModule } from '@angular/cdk/layout'; // 👈 necesario

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
export class LayoutComponent {
  sidebarAbierto = true;
  modoSidenav: 'over' | 'side' = 'side';

  constructor(private breakpointObserver: BreakpointObserver) {
    this.breakpointObserver.observe(['(max-width: 768px)']).subscribe(result => {
      this.modoSidenav = result.matches ? 'over' : 'side';
      this.sidebarAbierto = !result.matches;
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
