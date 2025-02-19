import 'package:flutter/material.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/time_line_card.dart';

import '../../../../../constant.dart';


class TrackYourOrderViewBody extends StatelessWidget {
  const TrackYourOrderViewBody({super.key});
  static const  List<String> steps = [
    "تم طلبه",
    "تم الشحن",
    "خرج للتوصيل",
    "تم التوصيل"
  ];
  final int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => TimeLineCard(steps: steps, currentStep: currentStep),
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );

  }
}



