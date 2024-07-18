import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

PreferredSizeWidget customAppBar({ required String title,
  bool showIcon = true,required BuildContext context}){


  return AppBar(
    backgroundColor: Colors.white,
    title: Text(title,style: textStyle.Bold19,),
    centerTitle: true,
    leading: Visibility(
      visible: showIcon,
      child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios)),
    ),
  );
}
