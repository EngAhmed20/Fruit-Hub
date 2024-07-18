import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/core/utilis/sized_box.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row (
      children: [
         const Expanded(
          child: Divider(
            color: Color(0xffdcdede),
          ),
        ),
        MySizedBox(width: 17),
        const Text(AppString.or,style: textStyle.semiBold16),
         MySizedBox(width: 17),
         const Expanded(
          child: Divider(
            color: Color(0xffdcdede),
          ),
        ),

      ],
    );
  }
}
