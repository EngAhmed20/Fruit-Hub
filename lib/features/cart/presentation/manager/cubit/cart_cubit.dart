import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/features/cart/domain/entities/cart_entities.dart';
import 'package:fruits_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntities cartEntities=CartEntities([]);
  void addCartItem(ProductEntity product){
    bool isExist=cartEntities.isExist(product);
    var cartItem=cartEntities.getCartItem(product);
    if(isExist)
      {
        cartItem.increaseCount();
        //inc item count
      }else{
      cartEntities.addCartItem(cartItem);


    }
    emit(CartItemAdded());
  }
  void removeCartItem(CartItemEntity cartItem){
    cartEntities.removeCartItem(cartItem);
    emit(CartItemRemoved());
  }
  void updateCartItemCount(CartItemEntity cartItem,{required bool increment}){
    if(increment==true){
      cartItem.increaseCount();
    }
    else{
      cartItem.decreaseCount();
    }
    emit(CartItemUpdated(cartItem));
  }

}
