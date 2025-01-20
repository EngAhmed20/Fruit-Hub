import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/summary_of_payment_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              cost: '150 ${AppString.currency}',
            ),
            const SizedBox(
              height: 8,
            ),
            SummaryOfPaymentWidget(
              title: AppString.deliveryFee,
              cost: '10 ${AppString.currency}',
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
              cost: '160 ${AppString.currency}',
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
                Text(
                  'شارع النيل، مبنى رقم ١٢٣',
                  style: textStyle.regular16,
                ),
                Spacer(),
                TextButton.icon(
                    onPressed: () {},
                    label: Row(
                      children: [
                        Icon(Icons.edit_outlined),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(AppString.edit),
                      ],
                    ))
              ],
            )
          ]),
        ),
      ],
    );
  }
}
