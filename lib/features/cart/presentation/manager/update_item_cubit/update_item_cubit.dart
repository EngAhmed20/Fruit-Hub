import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/cart_item_entity.dart';

part 'update_item_state.dart';

class UpdateItemCubit extends Cubit<UpdateItemState> {
  UpdateItemCubit() : super(UpdateItemInitial());
  void updateCartItemCount(CartItemEntity cartItem,{required bool increment}){
    if(increment==true){
      cartItem.increaseQuantity();
    }
    else{
      cartItem.decreaseQuantity();
    }
    emit(CartItemUpdated(cartItem));
  }

}
