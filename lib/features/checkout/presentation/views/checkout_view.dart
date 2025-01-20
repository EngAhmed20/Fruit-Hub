import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruits_app/features/checkout/presentation/manager/cubit/checkout_cubit.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/checkout_view_body.dart';


class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartItems});
  static const routeName = "checkoutView";
  final List<CartItemEntity>cartItems;


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
    create: (context)=>CheckoutCubit(cartItems)..init(),
    child: BlocBuilder<CheckoutCubit,CheckoutState>(

      builder: (context,state){
        var cubit = context.read<CheckoutCubit>();

        return Scaffold(
        appBar: buildAppBar(context,title: cubit.AppBarText(),showNotification: false,showBackButton: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CheckoutViewBody(),
        ),
      );},
    ),
    );
  }
}
