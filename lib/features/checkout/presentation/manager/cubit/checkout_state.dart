part of 'checkout_cubit.dart';

@immutable
abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class InitState extends CheckoutState {}
class ShippingSectionSelected extends CheckoutState {}
class ChangeCurrentPageIndex extends CheckoutState {}
