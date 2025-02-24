import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/features/profile/presentation/manager/cubit/order_tracking_cubit.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/time_line_card.dart';

import '../../../../../constant.dart';
import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/widgets/loading_animated_widget.dart';


class TrackYourOrderViewBody extends StatelessWidget {
  const TrackYourOrderViewBody({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderTrackingCubit,OrderTrackingState>(
        builder:(context,state){
          var cubit=context.watch<OrderTrackingCubit>();
          if(state is OrderTrackingLoading){
            return LoadingAnimatedWidget(context);
          }
          if(state is OrderTrackingFailure){
            return  Center(child: Text(state.errorMessage,style: textStyle.Bold16,),);

          }
          if(state is OrderTrackingSuccess){
            return Padding(padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => TimeLineCard(steps: cubit.steps, currentStep: cubit.getOrderCurrentStep(state.orders[index]),order:state.orders[index],),
                      itemCount: state.orders.length,
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

          }else{
            return const Center(child: Text(AppString.noOrdersYet));
          }
    }, listener: (context,state){
    });

  }
}



