import { Pipe, PipeTransform } from '@angular/core';
import { ItemStatus } from './models/sellerOrderItem.model';

@Pipe({
  name: 'enumToString',
  standalone: true
})
export class EnumToStringPipe implements PipeTransform {
  transform(value: ItemStatus): string {
    return ItemStatus[value];
  }

}
