
import 'package:fruits_app/features/checkout/data/model/shipping_address_model.dart';
import 'package:fruits_app/features/profile/domain/entities/order_status_entity.dart';

class OrderStatusModel{
  final double totalPrice;
  final String uId;
  final String status;
  final String orderId;
  final String paymentMethod;
  final ShippingAddressModel shippingAddressModel;

  OrderStatusModel({required this.paymentMethod,required this.totalPrice, required this.uId, required this.status, required this.orderId, required this.shippingAddressModel});
  factory OrderStatusModel.fromJson(Map<String,dynamic>json)=>OrderStatusModel(
  totalPrice: json['totalPrice'].toDouble(),
  uId: json['uId'],
      status: json['status'],
      orderId: json['orderId'],
  shippingAddressModel: ShippingAddressModel.fromJson(json['shippingAddressModel']),
      paymentMethod:json['paymentMethod']);

OrderStatusEntity toEntity()=>OrderStatusEntity(totalPrice: totalPrice,
    uId: uId,
    status: status,
    orderId: orderId,
    paymentMethod: paymentMethod,
    shippingAddressEntity: shippingAddressModel.toEntity());
}

