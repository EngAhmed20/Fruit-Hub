import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

class FeaturedButton extends StatelessWidget {
  const FeaturedButton({super.key,required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 32,
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
            onPressed: onPressed, child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FittedBox(child: Text(AppString.featuredItemButton,style:textStyle.Bold16.copyWith(color:AppColors.primaryColor))),
            )));

  }
}
