import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/validate.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/custom_snack_bar.dart';
import 'package:fruits_app/features/profile/presentation/manager/cubit/user_info_cubit.dart';

import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/utilis/app_style/app_text_styles.dart';
import '../../../../../core/widgets/text_form_filed.dart';

class UserInfoViewBody extends StatelessWidget {
  const UserInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserInfoCubit, UserInfoState>(
        builder: (context, state) {
          var cubit = context.watch<UserInfoCubit>();
          return SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              autovalidateMode: cubit.autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    AppString.personalInfo,
                    style: textStyle.semiBold16,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Form(
                    key: cubit.nameKey,
                    autovalidateMode: cubit.nameAutoValidateMode,
                    child: defaultTextForm(
                        controller: cubit.nameController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return AppString.validateName;
                          }
                        },
                        hint: AppString.name),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextForm(
                      controller: cubit.emailController,
                      read_only: true,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return AppString.validateEmail;
                        }
                      },
                      hint: AppString.email),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    AppString.changeUserPass,
                    style: textStyle.semiBold16,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  defaultTextForm(
                      controller: cubit.currentPasswordController,
                      validator: (String? value) {
                        return validateCurrentPassword(value);
                      },
                      hint: AppString.currentPassword,
                      ispass: cubit.isHideCurrentPass,
                      suffixPress: () {
                        cubit.changeVisablity(PasswordFieldType.current);
                      },
                      suffixIcon: cubit.sufIconCurrent),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextForm(
                      controller: cubit.newPasswordController,
                      validator: (String? value) {
                        return validateNewPassword(value);
                      },
                      hint: AppString.newPassword,
                      ispass: cubit.isHideNewPass,
                      suffixPress: () {
                        cubit.changeVisablity(PasswordFieldType.newPass);
                      },
                      suffixIcon: cubit.sufIconNew),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextForm(
                      controller: cubit.confirmPasswordController,
                      validator: (String? value) {
                        return validateConfirmPassword(
                            value, cubit.newPasswordController.text);
                      },
                      hint: AppString.confirmPasswordChange,
                      ispass: cubit.isHideConfirmPass,
                      suffixPress: () {
                        cubit.changeVisablity(PasswordFieldType.confirm);
                      },
                      suffixIcon: cubit.sufIconConfirm),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  CustomButton(
                      text: AppString.saveChanges,
                      isLoading: state is UserInfoLoading,
                      onPressed: () {
                        bool isNameChanged = cubit.nameController.text.trim().isNotEmpty;
                        bool isChangingPassword = cubit.currentPasswordController.text.trim().isNotEmpty ||
                            cubit.newPasswordController.text.trim().isNotEmpty ||
                            cubit.confirmPasswordController.text.trim().isNotEmpty;
                        if (isNameChanged && !isChangingPassword) {
                          if (cubit.nameKey.currentState!.validate()) {
                            cubit.updateUserData(newName: cubit.nameController.text);
                          }
                        } else if (isChangingPassword) {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.updateUserData(
                              newName: cubit.nameController.text,
                              currentPassword: cubit.currentPasswordController.text,
                              newPassword: cubit.newPasswordController.text,
                            );
                          }
                          else{
                            cubit.changeAutoValidateMode(AutoValidateModeType.allForm);

                          }
                        }else{
                          cubit.changeAutoValidateMode(AutoValidateModeType.name);
                        }

                      }),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if(state is UpdateUserInfoLoaded){
            customSnackBar(
                context: context,msg:  AppString.savedChangesSuccess, iconMsg: Icons.check_circle_outline,
                iconColor:Colors.white);
          }
          else if(state is UpdateUserInfoError){
            customSnackBar(context: context, msg:state.error);

          }
        });
  }
}
