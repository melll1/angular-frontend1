import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-root',
  standalone: true, // Es un componente standalone
  imports: [RouterOutlet], // Importamos RouterOutlet para que funcione el enrutamiento
  templateUrl: './app.component.html', // Plantilla HTML que usará este componente
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'angular-frontend';
}
