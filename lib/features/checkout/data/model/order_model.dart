
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_app/constant.dart';
import 'package:fruits_app/features/checkout/data/model/order_product_model.dart';
import 'package:fruits_app/features/checkout/data/model/shipping_address_model.dart';
import 'package:fruits_app/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel{
  final double totalPrice;
  final String paymentMethod;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProductModel;
  final String uId;
  final String? orderId;
  OrderModel({this.orderId,required this.totalPrice, required this.paymentMethod, required this.shippingAddressModel, required this.orderProductModel, required this.uId});


  factory OrderModel.fromEntity(OrderEntity entity) {
  return OrderModel(
    orderId:entity.orderId,
    totalPrice: (entity.payWithCash==true)?entity.cartItems.calculateTotalPrice()+deliveryCost:entity.cartItems.calculateTotalPrice(),
    shippingAddressModel: ShippingAddressModel.fromEntity(entity.addressEntity),
    orderProductModel: entity.cartItems.cartItems.map((e)=>OrderProductModel.fromEntity(e)).toList(),
    uId: entity.uID,
    paymentMethod: entity.payWithCash==true?cash:paypal,

  );
  }
  toJson() => {
    'totalPrice': totalPrice,
    'uId': uId,
    'status': 'pending',
    'date': FieldValue.serverTimestamp(),
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProductModel': orderProductModel.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
    'orderId':Uuid().v4(),
  };



}