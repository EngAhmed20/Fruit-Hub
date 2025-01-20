import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.title,
      required this.index,
      required this.isActive});
  final String title, index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: ActiveStepItem(title: title),
        secondChild: InActiveStepItem(title: title, index: index),
        crossFadeState:
            isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(microseconds: 300));
  }
}
