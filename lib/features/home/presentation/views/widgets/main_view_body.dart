import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fruits_app/features/cart/presentation/views/cart_view.dart';
import 'package:fruits_app/features/profile/presentation/views/profile_view.dart';

import '../../../../../core/widgets/custom_snack_bar.dart';
import '../products_view.dart';
import '../home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});
  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          customSnackBar(
            context: context,
            msg: AppString.addToCartSuccess,
            iconMsg: Icons.add_shopping_cart_outlined,
            iconColor: Colors.white,
          );
        }
        if (state is CartItemRemoved) {
          customSnackBar(
            context: context,
            msg: AppString.removeFromCartSuccess,
            iconMsg: Icons.remove_shopping_cart_outlined,
            iconColor: Colors.white,
          );
        }
      },
      child: _getCurrentView(currentViewIndex), // Dynamically build the selected view
    );
  }

  Widget _getCurrentView(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const ProductsView();
      case 2:
        return const CartView();
      case 3:
        return const ProfileView(); // Created ONLY when selected
      default:
        return const HomeView();
    }
  }
}






/*
class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentViewIndex});
  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit,CartState>(
      listener: (context,state){
        if(state is CartItemAdded){
          customSnackBar(context:context,msg: AppString.addToCartSuccess,iconMsg: Icons.add_shopping_cart_outlined,iconColor:Colors.white);
        }
        if(state is CartItemRemoved){
          customSnackBar(context:context,msg: AppString.removeFromCartSuccess,iconMsg: Icons.remove_shopping_cart_outlined,iconColor:Colors.white);
        }

      },
      child:  IndexedStack(
          index: currentViewIndex,
          children: [
            HomeView(),
            ProductsView(),
            CartView(),
            ProfileView(),
          ],
        )

    );
  }
}
*/