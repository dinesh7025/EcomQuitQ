import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageProductComponent } from './manage-products.component';

describe('ManageProductsComponent', () => {
  let component: ManageProductComponent;
  let fixture: ComponentFixture<ManageProductComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ManageProductComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageProductComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
