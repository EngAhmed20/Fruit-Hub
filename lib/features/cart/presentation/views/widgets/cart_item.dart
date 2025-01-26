import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruits_app/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fruits_app/features/cart/presentation/manager/update_item_cubit/update_item_cubit.dart';

import '../../../../../generated/assets.dart';
import 'cart_item_action_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItemEntity,
  });
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateItemCubit, UpdateItemState>(
        buildWhen: (prev,current) {
      if (current is CartItemUpdated) {
        if (current.cartItemEntity == cartItemEntity) {
          return true;
        }
      }
      return false;
    }, builder: (context, state) {
      log('we are build ');
      return IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 73,
              height: 92,
              color: const Color(0xff3f5f7),
              child: Image.network(
                cartItemEntity.productEntity.imageUrl!,
              ),
            ),
            const SizedBox(
              width: 17,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        cartItemEntity.productEntity.name,
                        style: textStyle.Bold13,
                      ),
                      Spacer(),
                      GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .removeCartItem(cartItemEntity);
                          },
                          child: SvgPicture.asset(
                            Assets.imagesTrash,
                          ))
                    ],
                  ),
                  Text(
                    '${cartItemEntity.calculateTotalWeight()} كم',
                    style: textStyle.regular13
                        .copyWith(color: AppColors.secondartColor),
                  ),
                  Row(
                    children: [
                      CartIncAndDecButton(
                        icon: Icons.add,
                        color: Colors.white,
                        backgroundColor: AppColors.primaryColor,
                        onTap: () {
                          context.read<UpdateItemCubit>().updateCartItemCount(
                              cartItemEntity,
                              increment: true);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          '${cartItemEntity.quantity}',
                          style: textStyle.Bold16,
                        ),
                      ),
                      CartIncAndDecButton(
                          icon: Icons.remove,
                          color: Colors.grey,
                          backgroundColor: Colors.transparent,
                          onTap: () {
                            context.read<UpdateItemCubit>().updateCartItemCount(
                                cartItemEntity,
                                increment: false);
                          }),
                      Spacer(),
                      Text(
                        '${cartItemEntity.calculateTotalPrice()} ${AppString.currency}',
                        style: textStyle.Bold16.copyWith(
                            color: AppColors.secondartColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
