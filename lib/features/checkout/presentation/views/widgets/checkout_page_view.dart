import 'package:flutter/material.dart';

import '../../manager/cubit/checkout_cubit.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.cubit,
  });

  final CheckoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: cubit.pageController,
      itemBuilder:(context,index){
        return cubit.getPages()[index];
      },itemCount: cubit.getPages().length,);
  }
}
