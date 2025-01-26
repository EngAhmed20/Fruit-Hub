import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/summary_of_payment_widget.dart';

import '../../../../../constant.dart';
import '../../manager/cubit/checkout_cubit.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.watch<CheckoutCubit>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          PaymentItem(
            title: AppString.summaryOfReq,
            widget: Column(children: [
              SummaryOfPaymentWidget(
                title: AppString.subTotal,
                cost: '${cubit.cartItems.calculateTotalPrice()} ${AppString.currency}',
              ),
              const SizedBox(
                height: 8,
              ),
              SummaryOfPaymentWidget(
                title: AppString.deliveryFee,
                cost:cubit.orderEntity.payWithCash==true? '${deliveryCost} ${AppString.currency}':AppString.free,
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(
                thickness: 0.5,
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 8,
              ),
              SummaryOfPaymentWidget(
                title: AppString.totalPrice,
                cost:cubit.orderEntity.payWithCash==true? '${cubit.cashOnDeliveryPrice} ${AppString.currency}':'${cubit.paypalPaymentPrice} ${AppString.currency}',
                style: textStyle.Bold16,
              ),
              const SizedBox(
                height: 8,
              ),
            ]),
          ),
          const SizedBox(
            height: 16,
          ),
          PaymentItem(
            title: AppString.deliveryAddress,
            widget: Column(children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(cubit.orderEntity.addressEntity.shippingAddressDetails(),
                      style: textStyle.regular16,
                    ),
                  ),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
