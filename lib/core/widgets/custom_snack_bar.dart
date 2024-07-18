import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

void customSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.error_outlined,color: Colors.red,size: 25,),
          Text(
            msg,
            style: textStyle.semiBold16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      margin: EdgeInsets.all(2),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 10,
      backgroundColor: Colors.black87,
    ),
  );
}
