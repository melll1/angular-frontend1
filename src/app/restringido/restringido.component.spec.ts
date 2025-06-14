import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RestringidoComponent } from './restringido.component';

describe('RestringidoComponent', () => {
  let component: RestringidoComponent;
  let fixture: ComponentFixture<RestringidoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RestringidoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RestringidoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
