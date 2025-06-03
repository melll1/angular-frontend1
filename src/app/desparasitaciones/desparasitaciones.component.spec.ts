import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DesparasitacionesComponent } from './desparasitaciones.component';

describe('DesparasitacionesComponent', () => {
  let component: DesparasitacionesComponent;
  let fixture: ComponentFixture<DesparasitacionesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DesparasitacionesComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DesparasitacionesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
