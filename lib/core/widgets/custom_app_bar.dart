import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

import '../../generated/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesBackIcon),
        Spacer(),
        Text(AppString.bestSellerTitle,style: textStyle.Bold19),
        Spacer(),
        Container(
            padding:const EdgeInsets.all(5),
            decoration:ShapeDecoration(shape:OvalBorder(),color: Color(0xffeef8ed)) ,
            child: SvgPicture.asset(Assets.imagesNotification)),

      ],
    );
  }
}
