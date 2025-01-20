import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/checkout/presentation/views/widgets/step_item.dart';


class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPageIndex, required this.onStepTapped});
  final int  currentPageIndex;
  final Function(int) onStepTapped; // Callback لتمرير الـ index

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(getSteps().length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: (){
                onStepTapped(index);
              },
              child: StepItem(
                title: getSteps()[index],
                index: (index+1).toString(),
                isActive: index<=currentPageIndex,
              ),
            ),
          );
        }));
  }


}
List<String> getSteps() {
  return [
    AppString.shipping,
    AppString.address,
    AppString.payment,
   /* AppString.review,*/
  ];
}