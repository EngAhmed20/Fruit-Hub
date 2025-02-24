import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/services/get_it_services.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/profile/domain/repo/order_status_repo.dart';
import 'package:fruits_app/features/profile/presentation/manager/cubit/order_tracking_cubit.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/track_your_order_view_body.dart';

class TrackYourOrderView extends StatelessWidget {
  const TrackYourOrderView({super.key});
  static const routeName = 'TrackYourOrderView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: AppString.orderState, showNotification: false),
      body: BlocProvider(
        create: (context)=>OrderTrackingCubit(getIt.get<OrdersStatusRepo>())..getData(),
        child: TrackYourOrderViewBody(),
      ),
    );
  }
}
/*
      body: Column(
        children: [
          Expanded(child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context,index)=>TrackYourOrderViewBody(),itemCount: 5,)),
        ],
      ),

 */
