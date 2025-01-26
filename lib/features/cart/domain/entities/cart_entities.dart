import 'package:fruits_app/features/cart/presentation/views/widgets/cart_item.dart';

import '../../../../core/entities/product_entity.dart';
import 'cart_item_entity.dart';

class CartEntities{
  final List<CartItemEntity> cartItems;

  CartEntities(this.cartItems);
  addCartItem(CartItemEntity cartItemEntity){
    cartItems.add(cartItemEntity);


  }
  calculateTotalPrice(){
    double totalPrice = 0;
    for(var cartItem in cartItems){
      totalPrice+=cartItem.calculateTotalPrice();
    }
    return totalPrice;
  }
  void removeCartItem(CartItemEntity cartItemEntity){
    cartItems.remove(cartItemEntity);
  }
  bool isExist(ProductEntity product){

    for(var cartItem in cartItems){
      if(cartItem.productEntity==product){
        return true;
      }

    }
    return false;
  }
  CartItemEntity getCartItem(ProductEntity product){

    for(var cartItem in cartItems){
      if(cartItem.productEntity==product){
        return cartItem;
      }

    }
    return CartItemEntity(productEntity: product,quantity: 1);
  }



}