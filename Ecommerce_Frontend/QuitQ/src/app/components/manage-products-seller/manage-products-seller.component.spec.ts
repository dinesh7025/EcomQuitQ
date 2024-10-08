import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageProductsSellerComponent } from './manage-products-seller.component';

describe('ManageProductsSellerComponent', () => {
  let component: ManageProductsSellerComponent;
  let fixture: ComponentFixture<ManageProductsSellerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ManageProductsSellerComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageProductsSellerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
