part of 'user_info_cubit.dart';

@immutable
abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UpdateUserInfoLoaded extends UserInfoState {

}

class UpdateUserInfoError extends UserInfoState {
  final String error;
   UpdateUserInfoError({required this.error });

}

class ChangePassVisablity extends UserInfoState {}