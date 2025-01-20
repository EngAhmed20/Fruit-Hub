import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_style/app_text_styles.dart';

class SummaryOfPaymentWidget extends StatelessWidget {
  const SummaryOfPaymentWidget({
    super.key, required this.title, required this.cost, this.style,
  });
  final String title;
  final String cost;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Text(title, style:style?? textStyle.regular16,),
      Text(cost, style:style?? textStyle.semiBold16),
    ],);
  }
}
