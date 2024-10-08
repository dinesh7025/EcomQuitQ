import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageOrderSellerComponent } from './manage-order-seller.component';

describe('ManageOrderSellerComponent', () => {
  let component: ManageOrderSellerComponent;
  let fixture: ComponentFixture<ManageOrderSellerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ManageOrderSellerComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageOrderSellerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
