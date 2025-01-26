import '../order_entity.dart';
import 'Amount.dart';
import 'Item_list.dart';

class PaypalPaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromEntity(OrderEntity entity) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(entity),
      description: 'Payment description',
      itemList: ItemList.fromEntity(items:entity.cartItems.cartItems),
    );
  }


  Map<String, dynamic> toJson({required double exchangeRate}) {
    final map = <String, dynamic>{};
    if (amount != null) {
      map['amount'] = amount?.toJson(exchangeRate: exchangeRate);
    }
    map['description'] = description;
    map['item_list'] = itemList?.toJson(exchangeRate: exchangeRate);
    return map;
  }

}