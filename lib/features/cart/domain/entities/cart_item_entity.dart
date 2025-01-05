import 'package:equatable/equatable.dart';
import 'package:fruits_app/core/entities/product_entity.dart';

class CartItemEntity extends Equatable{
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity,this.count=0});
  num calculateTotalPrice(){
    return productEntity.price * count;
  }
  num calculateTotalWeight(){
   // return productEntity.unitAmount*count;
    return count;
  }
  increaseCount(){
    count++;
  }
  decreaseCount(){
    if(count > 1) count--;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
