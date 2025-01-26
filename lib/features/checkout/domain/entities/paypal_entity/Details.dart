import 'package:fruits_app/core/helper_function/getExchangeRate.dart';

import '../../../../../constant.dart';
import '../order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  String? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson({required double exchangeRate}) => {
    'subtotal': exchangeToDollarRate(subtotal!,exchangeRate),
    'shipping':shipping!=0?exchangeToDollarRate(shipping!,exchangeRate):shipping,
    'shipping_discount':shippingDiscount,
  };

  factory DetailsEntity.fromEntity(OrderEntity entity) => DetailsEntity(
    subtotal: entity.cartItems.calculateTotalPrice().toString(),
    shipping: entity.calculateShippingCost().toString(),
    shippingDiscount: entity.calcualteShippingDiscount().toString(),
  );
}