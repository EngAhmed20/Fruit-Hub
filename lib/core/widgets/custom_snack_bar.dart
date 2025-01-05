import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

void customSnackBar({required BuildContext context, required String msg,IconData?iconMsg,Color?iconColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            msg,
            style: textStyle.semiBold16,
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 10,),
          Icon(iconMsg??Icons.error_outlined,color: iconColor??Colors.red,size: 25,),
        ],
      ),
      margin: const EdgeInsets.all(2),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 10,
      backgroundColor: AppColors.lightPrimaryColor,
    ),
  );
}
