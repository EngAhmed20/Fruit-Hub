class ShippingAddressEntity {
  String? name;
  String? email;
  String? address;
  String? city;
  String? phone;
  String? addressDetails;

  ShippingAddressEntity(
      {this.name,
      this.email,
      this.address,
      this.city,
      this.phone,
      this.addressDetails});

  String shippingAddressDetails(){
    if(addressDetails!.isNotEmpty){
      return '${addressDetails} , ${address} , ${city}';


    }
    else{
      return '${address} , ${city}';

      }
  }
}
