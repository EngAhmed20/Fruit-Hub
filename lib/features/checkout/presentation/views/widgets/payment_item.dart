import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_decoration.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.widget});
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: textStyle.Bold16,),
        const SizedBox(height: 8,),
        Container(
          decoration: AppDecorations.greyBoxDecoration,
          padding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
          child: widget,
        ),
      ],
    );
  }
}
