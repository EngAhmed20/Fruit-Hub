import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class loginCubit extends Cubit<loginState> {
  loginCubit(this.authRepo) : super(loginInitial());
  static loginCubit get(context)=>BlocProvider.of(context);
  final AuthRepo authRepo;
  bool isHidePass=false;
  IconData sufIcon= Icons.visibility_outlined;
  void changeVisablity(){
    isHidePass=!isHidePass;
    sufIcon=isHidePass?Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(changePassVisablity());

  }
  Future<void> loginUser(String email,String password)async{
    emit(loginLoading());
    emit(state);
    var result=await authRepo.signinWithEmailAndPass(email, password);
    result.fold((failure)=>emit(loginFailure(errorMessage: failure.message)),
            (user) =>emit(loginSuccess(userEntity: user)) );}
  Future <void> loginWithGoogle()async{
    emit(loginLoading());
    var result=await authRepo.signinWithGoogle();
    result.fold((failure)=>emit(loginFailure(errorMessage: failure.message)),
            (user) =>emit(loginSuccess(userEntity: user)) );
  }
  Future<void> loginWithFacebook()async{
    emit(loginLoading());
    var result=await authRepo.signinWithFacebook();
    result.fold((failure)=>emit(loginFailure(errorMessage: failure.message)),
            (user) =>emit(loginSuccess(userEntity: user)) );
  }

}
