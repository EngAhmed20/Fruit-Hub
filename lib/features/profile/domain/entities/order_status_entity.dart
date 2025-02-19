import '../../../checkout/domain/entities/shipping_address_entity.dart';

class OrderStatusEntity{
  final double totalPrice;
  final String uId;
  final String status;
  final String orderId;
  final ShippingAddressEntity shippingAddressEntity;

  OrderStatusEntity({required this.totalPrice, required this.uId, required this.status, required this.orderId, required this.shippingAddressEntity});


}