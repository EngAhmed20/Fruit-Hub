import 'package:fruits_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruits_app/features/checkout/domain/entities/shipping_address_entity.dart';

class OrderEntity{
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShippingAddressEntity addressEntity;

  OrderEntity(this.cartItems, this.payWithCash,this.addressEntity);

}