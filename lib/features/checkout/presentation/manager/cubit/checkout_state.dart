part of 'checkout_cubit.dart';

@immutable
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class InitStateLoading extends CheckoutState {}
class InitStateSuccess extends CheckoutState {}

class ShippingSectionSelected extends CheckoutState {}
class ChangeCurrentPageIndex extends CheckoutState {}
class AddOrderLoadingState extends CheckoutState {}
class AddOrderSuccess extends CheckoutState {}
class AddOrderFailureState extends CheckoutState{
  final String errMsg;

  AddOrderFailureState(this.errMsg);
}
class PaypalPaymentLoadingState extends CheckoutState{

}
class PaypalPaymentSuccessState extends CheckoutState {}
class PaypalPaymentFailureState extends CheckoutState{
  final String errMsg;

  PaypalPaymentFailureState(this.errMsg);
}
