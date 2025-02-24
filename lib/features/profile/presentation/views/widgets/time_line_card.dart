import 'package:flutter/material.dart';
import 'package:fruits_app/features/profile/domain/entities/order_status_entity.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/recipient_information_widget.dart';

import '../../../../../constant.dart';
import '../../../../../core/helper_function/dummy_product_entity.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/utilis/app_style/app_text_styles.dart';
import 'orders_time_line_list_view.dart';

class TimeLineCard extends StatelessWidget {
  const TimeLineCard({
    super.key,
    required this.steps,
    required this.currentStep, required this.order,
  });

  final List<String> steps;
  final int currentStep;
  final OrderStatusEntity order;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppString.totalPrice,
                    style: textStyle.Bold19,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('${order.totalPrice} $currency',
                      style: textStyle.Bold16.copyWith(
                        color: AppColors.primaryColor,
                        decoration: order.paymentMethod == paypal
                          ? TextDecoration.lineThrough
                          : null,
                      )),
                ],
              ),
              OrdersTimeLineListView(steps: steps, currentStep: currentStep),
              RecipientInformationWidget(shippingAddressEntity: order.shippingAddressEntity,),

            ],
          )
      ),
    );
  }
}
