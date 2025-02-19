import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../../core/utilis/app_colors.dart';

class OrdersTimeLineWidget extends StatelessWidget {
  const OrdersTimeLineWidget({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.index,
  });

  final List<String> steps;
  final int currentStep;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: index == 0,
      isLast: index == steps.length - 1,
      beforeLineStyle: LineStyle(
        color: index <= currentStep ? Colors.green : Colors.grey,
      ),
      indicatorStyle: IndicatorStyle(
        width: 30,
        color: index <= currentStep ? Colors.green : Colors.grey,
        iconStyle: IconStyle(
          iconData: index <= currentStep ? Icons.check : Icons.circle,
          color: Colors.white,
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
        child: Text(
          steps[index],
          style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: index <= currentStep ? AppColors.primaryColor : AppColors.secondartColor
          ),
        ),
      ),
    );
  }
}
