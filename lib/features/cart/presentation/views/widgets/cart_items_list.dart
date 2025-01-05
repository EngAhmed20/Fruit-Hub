import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_divider.dart';
import 'package:fruits_app/features/cart/presentation/views/widgets/cart_item.dart';

import '../../../domain/entities/cart_item_entity.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems,});
  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => CartItem(cartItemEntity: cartItems[index],),
      separatorBuilder: (context, index) => const CustomDivider(),
      itemCount: cartItems.length,
    );
  }
}

