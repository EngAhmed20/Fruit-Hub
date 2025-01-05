import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_style/app_text_styles.dart';

/*class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key, this.incrementFun, this.decrementFun,
  });
  final void Function()? incrementFun;
  final void Function()? decrementFun;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartIncAndDecButton(icon: Icons.add,color: Colors.white,backgroundColor: AppColors.primaryColor,onTap: incrementFun,),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('3',style: textStyle.Bold16,),
        ),
        CartIncAndDecButton(icon: Icons.remove,color: Colors.grey,backgroundColor: Colors.transparent,onTap:decrementFun),
        Spacer(),
        Text('60 جنيه ',style: textStyle.Bold16.copyWith(color: AppColors.secondartColor),)


      ],
    );
  }

}*/
class CartIncAndDecButton extends StatelessWidget {
  const CartIncAndDecButton({super.key, required this.icon, required this.color, required this.backgroundColor, this.onTap});
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
      return InkWell(
      onTap: onTap,
        borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 30,
        height: 30,
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Icon(icon,color: color,),

      ),
          );
  }
}

