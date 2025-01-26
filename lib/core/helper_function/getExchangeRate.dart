import 'dart:convert';

import 'package:http/http.dart' as http;
String exchangeToDollarRate(String value,double usd)  {
  // استدعاء API للحصول على سعر الصرف

    double egpValue = double.tryParse(value)!;
    double usdValue = (egpValue*usd);// سعر الصرف إلى الدولار
    return usdValue.toStringAsFixed(1);


}
Future<double>getExchangeDollarRate() async{
  final response = await http.get(
    Uri.parse('https://api.exchangerate-api.com/v4/latest/EGP'),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    double usd=data['rates']['USD'];
   return usd;

  } else {
    throw Exception('Failed to load exchange rate');
  }

}