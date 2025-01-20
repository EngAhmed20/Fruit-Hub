import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/utilis/app_style/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/cubit/cart_cubit.dart';
import '../../manager/update_item_cubit/update_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key, required this.onPressed,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context,) {
    return BlocBuilder<UpdateItemCubit, UpdateItemState>(
      builder: (context, state) {
        return CustomButton(
            text:
                '${AppString.payment}  ${context.read<CartCubit>().cartEntities.calculateTotalPrice()} ${AppString.currency}',
            textStyle: textStyle.Bold16.copyWith(color: Colors.white),
            onPressed: onPressed);
      },
    );
  }
}
