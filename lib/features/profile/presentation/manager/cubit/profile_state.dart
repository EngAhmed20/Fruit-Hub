part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileImageLoading extends ProfileState {}
class IdentifyInitSuccess extends ProfileState {}

class ProfileImageLoaded extends ProfileState {}

class ProfileImageUpdatingLoading extends ProfileState {}

class ProfileImageUpdatingLoaded extends ProfileState {}

class ProfileImageUpdatingError extends ProfileState {}
