import 'package:fruits_app/features/cart/domain/entities/cart_entities.dart';
import 'package:fruits_app/features/checkout/domain/entities/shipping_address_entity.dart';

import '../../../../constant.dart';

class OrderEntity{
  final CartEntities cartItems;
  final String uID;
  final String? orderId;


  bool? payWithCash;
   ShippingAddressEntity addressEntity;

  OrderEntity( this.cartItems, this.addressEntity, this.uID,  {this.payWithCash,this.orderId});
  calculateShippingCost(){
    if(payWithCash==true){
      return deliveryCost;
    }else{
      return 0;
    }
  }
  calcualteShippingDiscount(){
    return 0;

  }
  calculateTotalPriceAfterDiscountAndShipping(){
    if(payWithCash==true){
      return cartItems.calculateTotalPrice()+deliveryCost;
    }else{
      return cartItems.calculateTotalPrice();
    }
  }


}