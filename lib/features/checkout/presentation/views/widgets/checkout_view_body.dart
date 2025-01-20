import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/checkout/presentation/manager/cubit/checkout_cubit.dart';
import '../../../../../constant.dart';
import 'checkout_page_view.dart';
import 'checkout_steps.dart';


class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit,CheckoutState>(
      listener: (context,state){},
      builder: (context, state) {
        var cubit=context.watch<CheckoutCubit>();
        return Column(
          children: [
            const SizedBox(height: KHorizontalPadding,),
            CheckoutSteps(currentPageIndex: cubit.currentPageIndex,onStepTapped: (index){
              cubit.changePageBySteps(index);
            },),
            Expanded(child: CheckoutStepsPageView(cubit: cubit)),
            CustomButton(text: cubit.buttonText(), onPressed: (){
              cubit.goToNextSectionValidate();
            },textStyle:textStyle.Bold16.copyWith(color: Colors.white) ,),
            const SizedBox(height: 100,),


          ],
        );
      }
    );
  }
}


