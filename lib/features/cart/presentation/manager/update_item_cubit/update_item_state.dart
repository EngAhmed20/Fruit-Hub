part of 'update_item_cubit.dart';

@immutable
abstract class UpdateItemState {}

class UpdateItemInitial extends UpdateItemState {}
class CartItemUpdated extends UpdateItemState {
  final CartItemEntity cartItemEntity;
  CartItemUpdated(this.cartItemEntity);
}
