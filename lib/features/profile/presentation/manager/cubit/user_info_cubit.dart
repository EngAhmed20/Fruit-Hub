import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_app/core/helper_function/get_user.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'user_info_state.dart';
enum PasswordFieldType { current, newPass, confirm }
enum AutoValidateModeType{allForm,name}
class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(this.authRepo) : super(UserInfoInitial()) {
    onInit();
  }
  final AuthRepo authRepo;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> formKey ;
  late GlobalKey<FormState> nameKey ;


  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  AutovalidateMode nameAutoValidateMode = AutovalidateMode.disabled;



  onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    nameController.text = getUser().name;
    emailController.text = getUser().email;
    formKey=GlobalKey<FormState>();
    nameKey=GlobalKey<FormState>();
  }
  bool isHideCurrentPass=true;
  bool isHideNewPass=true;
  bool isHideConfirmPass=true;
  IconData sufIconCurrent = Icons.visibility_off_outlined;
  IconData sufIconNew = Icons.visibility_off_outlined;
  IconData sufIconConfirm = Icons.visibility_off_outlined;
  void changeVisablity(PasswordFieldType fieldType) {
    switch (fieldType) {
      case PasswordFieldType.current:
        isHideCurrentPass = !isHideCurrentPass;
        sufIconCurrent = isHideCurrentPass
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined;
        break;
      case PasswordFieldType.newPass:
        isHideNewPass = !isHideNewPass;
        sufIconNew = isHideNewPass
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined;
        break;
      case PasswordFieldType.confirm:
        isHideConfirmPass = !isHideConfirmPass;
        sufIconConfirm = isHideConfirmPass
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined;
        break;
    }
    emit(ChangePassVisablity());
  }
  Future <void> updateUserData({required String newName, String? newPassword,String? currentPassword})async{
    emit(UserInfoLoading());
    var result=await authRepo.updateUserData(newName: newName,newPassword: newPassword,currentPassword: currentPassword);
  result.fold((failure)=>emit(UpdateUserInfoError(error: failure.message)),(result){
    onInit();
    emit(UpdateUserInfoLoaded());});
  }
  changeAutoValidateMode(AutoValidateModeType type){
    switch(type){
      case AutoValidateModeType.allForm:
        autovalidateMode=AutovalidateMode.always;
        break;
      case AutoValidateModeType.name:
        nameAutoValidateMode=AutovalidateMode.always;
        break;
    }

    emit(ChangeAutoValidateMode());
  }
}
