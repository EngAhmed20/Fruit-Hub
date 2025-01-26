
import 'package:fruits_app/features/cart/domain/entities/cart_item_entity.dart';

class OrderProductModel{
  final String name;
  final String imgUrl;
  final String code;
  final double price;

  OrderProductModel({required this.name, required this.imgUrl, required this.code, required this.price});
  factory OrderProductModel.fromEntity(CartItemEntity entity){
    return OrderProductModel(
      name: entity.productEntity.name,
      imgUrl: entity.productEntity.imageUrl??'',
      code: entity.productEntity.code,
      price: entity.productEntity.price.toDouble(),

    );

  }
  toJson()=>{
    'name':name,
    'imgUrl':imgUrl,
    'code':code,
    'price':price
  };
}