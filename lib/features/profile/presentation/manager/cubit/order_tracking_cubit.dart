import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_tracking_state.dart';

class OrderTrackingCubit extends Cubit<OrderTrackingState> {
  OrderTrackingCubit() : super(OrderTrackingInitial());
}
