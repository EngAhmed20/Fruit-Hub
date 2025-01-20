import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({
    super.key, required this.title, required this.index,
  });
  final String title;
  final String index;

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
            backgroundColor: const Color(0xffF2F3F3),
            child: Text(index,style: textStyle.semiBold16,),
          ),
        ),
        const SizedBox(width: 5,),
        Text(title,style: textStyle.semiBold16.copyWith(color: const Color(0xffAAAAAA)),),

      ],
    );
  }
}
