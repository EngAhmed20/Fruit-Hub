import 'package:flutter/foundation.dart';
import 'package:fruits_app/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? phone;
  String? addressDetails;

  ShippingAddressModel(
      {this.name,
      this.email,
      this.address,
      this.city,
      this.phone,
      this.addressDetails});

factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity){
  return ShippingAddressModel(
    name: entity.name,
    email: entity.email,
    address:entity.address,
    city: entity.city,
    phone: entity.phone,
    addressDetails: entity.addressDetails
  );
}
toJson(){
  return{
    'name':name,
    'email':email,
    'address':address,
    'city':city,
    'phone':phone,
    'addressDetails':addressDetails
  };
}
  String shippingAddressDetails(){
    if(addressDetails!.isNotEmpty){
      return '${addressDetails} , ${address} , ${city}';


    }
    else{
      return '${address} , ${city}';

      }
  }
}
