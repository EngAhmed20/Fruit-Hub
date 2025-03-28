import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widgets/custom_divider.dart';
import 'package:fruits_app/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fruits_app/features/cart/presentation/views/widgets/cart_items_list.dart';
import 'package:fruits_app/features/checkout/presentation/views/checkout_view.dart';
import '../../../../../constant.dart';
import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import 'cart_header.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit=context.watch<CartCubit>();
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: Column(
                children: [
                  const SizedBox(height: KVerticalPadding,),
                  CustomAppBar(title: AppString.cartTitle,showBackButton: false,showNotificationIcon: false,),
                  const SizedBox(height: 16,),
                  CartHeader(cartCubit: cartCubit,),
                  const SizedBox(height: 12,),
                ],
              ),),
              SliverToBoxAdapter(
                child: CustomDivider(),
              ),
              CartItemsList(cartItems:cartCubit.cartEntities.cartItems,),
              SliverToBoxAdapter(
                child: CustomDivider(),
              ),
            ],
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height*.04,
              left: 0,
              right: 0,
              child: CustomCartButton(
                onPressed:(){
                  if(cartCubit.cartEntities.cartItems.isNotEmpty){

                Navigator.pushNamed(context,CheckoutView.routeName,arguments: cartCubit.cartEntities);}
                  else{
                    customSnackBar(msg: AppString.cartEmpty, context: context);
                  }

              },)),
        ],
      )
    );

  }
}

