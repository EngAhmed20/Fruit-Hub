import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/checkout/presentation/manager/cubit/checkout_cubit.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.watch<CheckoutCubit>();
    return Padding(
      padding: const EdgeInsets.only(top: 32,bottom: 100),
      child: Column(
        children: [
           ShippingItem(title: AppString.cashOnDelivery,description: AppString.deliveryFromThePlace,price: '40 ${AppString.currency}',isSelected: cubit.selectedShippingSection==1,onTap: (){
         cubit.changeSelectedShippingSection(1);
         },),
          const SizedBox(height: 8,),
           ShippingItem(title: AppString.buyNowPayLater,description: AppString.pleaseSelectPaymentMethod, price: AppString.free,isSelected: cubit.selectedShippingSection==2,onTap: (){
             cubit.changeSelectedShippingSection(2);
           },),
        ],
      ),
    );
  }
}
