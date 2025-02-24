import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/profile/domain/repo/order_status_repo.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/helper_function/get_user.dart';
import '../../../domain/entities/order_status_entity.dart';

part 'order_tracking_state.dart';

class OrderTrackingCubit extends Cubit<OrderTrackingState> {
  OrderTrackingCubit(this.ordersStatusRepo,) : super(OrderTrackingInitial());
  final OrdersStatusRepo ordersStatusRepo;
  String uId=getUser().uId;
      Future<void> getData() async {
    emit(OrderTrackingLoading());
    final orders = await ordersStatusRepo.getOrdersStatus(uId: uId);
    orders.fold(
        (failure) => emit(OrderTrackingFailure(errorMessage: failure.message)),
        (orders) => emit(OrderTrackingSuccess(orders: orders)));
  }
   List<String> steps = [
    "تم طلبه",
    "تم الشحن",
    "خرج للتوصيل",
    "تم التوصيل"
  ];
  int getOrderCurrentStep(OrderStatusEntity order){

   switch (order.status){
      case AppString.newOrdersStatus:
        return 0;
      case AppString.shippedOrderStatus:
       return  1;
      case AppString.inWayOrderStatus:
        return 2;
      case AppString.deliveredOrderStatus:
        return 3;
      default:
        return 0;
    }

  }
}

