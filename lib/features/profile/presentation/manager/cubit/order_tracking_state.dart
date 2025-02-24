part of 'order_tracking_cubit.dart';

@immutable
abstract class OrderTrackingState {}

class OrderTrackingInitial extends OrderTrackingState {}

class OrderTrackingLoading extends OrderTrackingState {}

class OrderTrackingSuccess extends OrderTrackingState {
  final List<OrderStatusEntity> orders;

  OrderTrackingSuccess({required this.orders});

}

class OrderTrackingFailure extends OrderTrackingState {
  final String errorMessage;

  OrderTrackingFailure({required this.errorMessage});

}

class CurrentStepUpdated extends OrderTrackingState {}
