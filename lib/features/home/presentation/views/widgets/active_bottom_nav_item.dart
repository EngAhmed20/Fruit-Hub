import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

class ActiveBottomNavItem extends StatelessWidget {
  const ActiveBottomNavItem({super.key, required this.activeImg, required this.text});
  final String activeImg;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 6),
        decoration: const BoxDecoration(
            color: Color(0xffEEEEEE),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(activeImg,width:40,),
            const SizedBox(width: 4,),
            Text(text,style: textStyle.semiBold16.copyWith(color:AppColors.primaryColor),),
          ],
        ),
      ),
    );
  }
}
