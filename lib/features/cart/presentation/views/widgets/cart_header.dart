import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

import '../../manager/cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key, required this.cartCubit});
  final CartCubit cartCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppString.cartHeader1,style: textStyle.semiBold16.copyWith(color: AppColors.primaryColor),),
          const SizedBox(width: 2,),
          Text('${cartCubit.cartEntities.cartItems.length}',style: textStyle.semiBold16.copyWith(color: AppColors.primaryColor),),
          const SizedBox(width: 2,),
          Text(AppString.cartHeader2,style: textStyle.semiBold16.copyWith(color: AppColors.primaryColor),)
        ],

    );
  }
}
