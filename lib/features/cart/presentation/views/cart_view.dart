import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/cart/presentation/manager/update_item_cubit/update_item_cubit.dart';
import 'package:fruits_app/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>UpdateItemCubit(),
        child: CartViewBody());
  }
}
