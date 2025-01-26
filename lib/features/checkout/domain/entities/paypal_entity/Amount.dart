
import '../../../../../constant.dart';
import '../../../../../core/helper_function/getExchangeRate.dart';
import '../../../../../core/helper_function/get_currency.dart';
import '../order_entity.dart';
import 'Details.dart';
class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderEntity entity) {
    return Amount(
      total: entity.calculateTotalPriceAfterDiscountAndShipping().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(entity),
    );
  }


 toJson({required double exchangeRate})=>{
      'total':  exchangeToDollarRate(total!,exchangeRate),
      'currency': currency,
      'details': details!.toJson(exchangeRate: exchangeRate),

    };

}