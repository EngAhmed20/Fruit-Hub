import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  static SignupCubit get(context)=>BlocProvider.of(context);
  final AuthRepo authRepo;
  bool isHidePass=false;
  IconData sufIcon= Icons.visibility_outlined;
  void changeVisablity(){
    isHidePass=!isHidePass;
    sufIcon=isHidePass?Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(changePassVisablity());

}

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignupLoading());
    var result =
        await authRepo.createUserWithEmailAndPass(email, password, name);
    result.fold((failure) => emit(SignupFailure(message: failure.message)),
        (userEntity) => emit(SignupSuccess(userEntity: userEntity)));
  }
}
