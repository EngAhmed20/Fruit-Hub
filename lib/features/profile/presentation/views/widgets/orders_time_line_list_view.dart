import 'package:flutter/material.dart';

import 'orders_time_line_widget.dart';

class OrdersTimeLineListView extends StatelessWidget {
  const OrdersTimeLineListView({
    super.key,
    required this.steps,
    required this.currentStep,
  });

  final List<String> steps;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OrdersTimeLineWidget(steps: steps, currentStep: currentStep, index: index);
      },
    );
  }
}
