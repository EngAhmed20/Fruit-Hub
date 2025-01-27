import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_snack_bar.dart';
import 'package:fruits_app/features/checkout/presentation/manager/cubit/checkout_cubit.dart';
import '../../../../../constant.dart';
import '../../../../../core/widgets/loading_animated_widget.dart';
import 'checkout_page_view.dart';
import 'checkout_steps.dart';


class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit,CheckoutState>(
      listener: (context,state){
        if (state is AddOrderSuccess||state is PaypalPaymentSuccessState) {
          customSnackBar(context: context, msg: AppString.productOrderedSuccessfully,iconColor: Colors.white,iconMsg: Icons.check_circle_outline);
        }
        else if (state is AddOrderFailureState){
          customSnackBar(context: context, msg:AppString.productOrderedFailure,iconColor: Colors.red,iconMsg: Icons.error_outline);
        }
        else if (state is PaypalPaymentFailureState){
          customSnackBar(context: context, msg: AppString.paymentFailed,iconColor: Colors.red,iconMsg: Icons.error_outline);
        }


      },
      builder: (context, state) {
        if (state is InitStateLoading) {
          return LoadingAnimatedWidget(context);
        }

        var cubit=context.watch<CheckoutCubit>();
        return Column(
          children: [
            const SizedBox(height: KHorizontalPadding,),
            CheckoutSteps(currentPageIndex: cubit.currentPageIndex,onStepTapped: (index){
              cubit.changePageBySteps(index,context);
            },),
            Expanded(child: CheckoutStepsPageView(cubit: cubit)),
            CustomButton(text: cubit.buttonText(), onPressed: (){
              cubit.goToNextSectionValidate(context);
            },textStyle:textStyle.Bold16.copyWith(color: Colors.white) ,isLoading: state is AddOrderLoadingState,),
            const SizedBox(height: 100,),


          ],
        );
      }
    );
  }

}


