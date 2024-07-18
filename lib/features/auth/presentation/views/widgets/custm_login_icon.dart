import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

class CustomLoginIcon extends StatelessWidget {
  CustomLoginIcon({super.key, required this.icon, required this.text,required this.onPressed});
  Widget? icon;
  final String text;
   void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 1),
            ),
          ),
          onPressed: onPressed,
          child: ListTile(
            visualDensity:const  VisualDensity(
              vertical: VisualDensity.minimumDensity,
            ),
            leading: icon,
            title: Text(text,style: textStyle.semiBold16,),
          )),
    );
  }
}
