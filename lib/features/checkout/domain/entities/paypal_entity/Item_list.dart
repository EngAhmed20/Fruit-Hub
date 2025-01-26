import '../../../../cart/domain/entities/cart_item_entity.dart';
import 'itemEntity.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});

  factory ItemList.fromEntity({required List<CartItemEntity> items}) {
  return ItemList(items: items.map((e) => ItemEntity.fromEntity(e)).toList());
  }

  Map<String, dynamic> toJson({required double exchangeRate}) => {
  'items': items?.map((e) => e.toJson(exchangeRate: exchangeRate)).toList(),
  };
  }
