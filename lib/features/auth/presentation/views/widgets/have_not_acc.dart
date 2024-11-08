import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/utilis/sized_box.dart';

class HaveOrNotHaveAcc extends StatelessWidget {
  const HaveOrNotHaveAcc({super.key, required this.text1, required this.text2,required this.onTap});
  final String text1;
  final String text2;
 final  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap:onTap,
          child: Text(text2,
              style: textStyle.semiBold16.copyWith(
                color: AppColors.primaryColor,
              )),
        ),

        Text(text1,
            style: textStyle.semiBold16.copyWith(
              color: Colors.black.withOpacity(0.5),
            )),
        MySizedBox(
          width: 5,
        ),
      ],
    );
  }
}
