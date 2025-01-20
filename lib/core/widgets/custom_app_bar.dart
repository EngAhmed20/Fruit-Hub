import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

import '../../generated/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title,  this.showBackButton=true, this.showNotificationIcon=true});
  final String title;
  final bool showBackButton;
  final bool showNotificationIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
            visible: showBackButton,
            child: InkWell(onTap: (){Navigator.pop(context);},child: SvgPicture.asset(Assets.imagesBackIcon,width: 44,))),
        Spacer(),
        Text(title,style: textStyle.Bold19),
        Spacer(),
        Visibility(
          visible: showNotificationIcon,
          child: Container(
              padding:const EdgeInsets.all(5),
              decoration:ShapeDecoration(shape:OvalBorder(),color: Color(0xffeef8ed)) ,
              child: SvgPicture.asset(Assets.imagesNotification)),
        ),

      ],
    );
  }
}
AppBar buildAppBar(context,
    {required String title,
      bool showBackButton = true,
      double horizontal =16,
      bool showNotification = true}) {
  return AppBar(
    backgroundColor: Colors.white,
    actions: [
      Visibility(
        visible: showNotification,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: horizontal),
          child: Container(
              padding:const EdgeInsets.all(5),
              decoration:ShapeDecoration(shape:OvalBorder(),color: Color(0xffeef8ed)) ,
              child: SvgPicture.asset(Assets.imagesNotification)),
        ),
      )
    ],
    leading: Visibility(
      visible: showBackButton,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: horizontal),
        child: InkWell(

          onTap: () {
            Navigator.pop(context);
          },
          splashColor: Colors.transparent, // Remove splash effect.
          highlightColor: Colors.transparent, // Remove highlight color.
          hoverColor: Colors.transparent, // Remove hover color.
          focusColor: Colors.transparent, // Remove focus color.
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          child: const Icon(
            Icons.arrow_back_ios_new,size: 24,
          ),
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: textStyle.Bold19,
    ),
  );
}
