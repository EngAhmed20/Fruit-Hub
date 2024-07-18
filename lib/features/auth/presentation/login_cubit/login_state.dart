part of 'login_cubit.dart';

@immutable
abstract class loginState {}

class loginInitial extends loginState {}

class loginLoading extends loginState {}

class loginSuccess extends loginState {
  final UserEntity userEntity;
  loginSuccess({required this.userEntity});
}

class loginFailure extends loginState {
  final String errorMessage;
   loginFailure({required this.errorMessage});
}

class changePassVisablity extends loginState {}
