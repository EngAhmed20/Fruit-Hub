import 'package:fruits_app/core/helper_function/getExchangeRate.dart';

import '../../../../../core/helper_function/get_currency.dart';
import '../../../../cart/domain/entities/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson({required double exchangeRate}) => {
    'name': name,
    'quantity': quantity,
    'price': exchangeToDollarRate(price!, exchangeRate),
    'currency': currency,
  };

  factory ItemEntity.fromEntity(CartItemEntity entity) {
    return ItemEntity(
      name: entity.productEntity.name,
      quantity: entity.quantity,
      price: entity.productEntity.price.toString(),
      currency: getCurrency(),
    );
  }
}