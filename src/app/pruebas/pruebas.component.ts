import { Component, AfterViewInit, ElementRef, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common'; // 👈 Agregado
import { FormsModule } from '@angular/forms';
// MaterializeCSS global declaration
declare var M: any;

@Component({
  selector: 'app-pruebas',
  templateUrl: './pruebas.component.html',
  styleUrls: ['./pruebas.component.css'],
  standalone: true,
  imports: [CommonModule, FormsModule] // ✅ Agrega CommonModule aquí
})
export class PruebasComponent implements AfterViewInit {
  errors: { [key: string]: string } = {};
  [key: string]: any;
  @ViewChild('tabsElement') tabsRef!: ElementRef;

  // Variables para login
  loginEmail: string = '';
  loginPassword: string = '';

  // Variables para registro
  signupNombre: string = '';
  signupApellido: string = '';
  signupEmail: string = '';
  signupPassword: string = '';
  signupPasswordConfirm: string = '';

  ngAfterViewInit(): void {
    // Inicializa los tabs de Materialize
    M.Tabs.init(this.tabsRef.nativeElement, {
      swipeable: true
    });
  }

  onLogin() {
    console.log('Login con:', this.loginEmail, this.loginPassword);
    // Aquí puedes llamar a tu API o lógica de autenticación
  }

  onRegister() {
    console.log('Registro con:', {
      nombre: this.signupNombre,
      apellido: this.signupApellido,
      email: this.signupEmail,
      password: this.signupPassword,
      confirmar: this.signupPasswordConfirm
    });
    // Aquí puedes llamar a tu API de registro
  }
}
