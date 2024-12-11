import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';

import '../../../../../generated/assets.dart';


class CustomCheckBox extends StatelessWidget {
   CustomCheckBox({required this.isChecked,required this.onChecked});
  final bool isChecked;
     //void Function(bool val)onChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onChecked(!isChecked);
      } ,
      child: AnimatedContainer(duration: Duration(milliseconds: 100),
      width: 25,
      height: 25,
        decoration: ShapeDecoration(
          color:isChecked?AppColors.primaryColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side:BorderSide(
              color: Color(0xffdcdede),
              width: 1,
            ),
          ),
        ),
        child: isChecked?Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset(Assets.imagesCheck,),
        ): SizedBox(),


      ),
    );
  }
}
