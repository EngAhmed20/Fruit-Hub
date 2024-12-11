import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/features/best_selling/presentation/views/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        children: [
           const Text(AppString.bestSellerTitle,style: textStyle.Bold16,),
          const Spacer(),
          Text(AppString.more,style: textStyle.regular13.copyWith(
            color: const Color(0xff949d9e)
          ),),

        ],
      ),
    );
  }
}
