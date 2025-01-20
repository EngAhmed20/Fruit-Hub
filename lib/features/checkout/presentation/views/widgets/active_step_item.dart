import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import '../../../../../generated/assets.dart';
class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 25,
          height: 25,
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: SvgPicture.asset(Assets.imagesCheck,),
          ),
        ),
        const SizedBox(width: 4,),
        Text(title,style: textStyle.Bold16.copyWith(color: AppColors.primaryColor),),

      ],
    );
  }
}
