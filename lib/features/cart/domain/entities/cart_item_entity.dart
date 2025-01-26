import 'package:equatable/equatable.dart';
import 'package:fruits_app/core/entities/product_entity.dart';

class CartItemEntity extends Equatable{
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity,this.quantity=0});
  num calculateTotalPrice(){
    return productEntity.price * quantity;
  }
  num calculateTotalWeight(){
   // return productEntity.unitAmount*count;
    return quantity;
  }
  increaseQuantity(){
    quantity++;
  }
  decreaseQuantity(){
    if(quantity > 1) quantity--;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
