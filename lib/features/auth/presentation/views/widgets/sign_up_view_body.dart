import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_snack_bar.dart';
import 'package:fruits_app/features/auth/presentation/signup_cubit/signup_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/have_not_acc.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/terms_conditions_widget.dart';

import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/utilis/sized_box.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/text_form_filed.dart';

class SignUpViewBody extends StatefulWidget {
  SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  late bool isTermsAccept=false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              MySizedBox(
                height: 30,
              ),
              defaultTextForm(
                  controller: nameController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validateEmail;
                    }
                  },
                  hint: AppString.name),
              MySizedBox(height: 20),
              defaultTextForm(
                  controller: emailController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validateEmail;
                    }
                  },
                  hint: AppString.email),
              MySizedBox(height: 20),
              defaultTextForm(
                  controller: passController,
                  ispass: SignupCubit.get(context).isHidePass,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validatePassword;
                    }
                  },
                  hint: AppString.password,
                  sufixpress: (){
                    SignupCubit.get(context).changeVisablity();
                  },
                  suficon: SignupCubit.get(context).sufIcon),
              MySizedBox(height: 16),
              TermsAndConditionWidget(onChecked: (value){
                isTermsAccept=value;

              },),
              MySizedBox(height: 30),
              CustomButton(
                text: AppString.createNewAcc,
                textStyle: textStyle.semiBold16.copyWith(color: Colors.white),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if(isTermsAccept==true){
                      context.read<SignupCubit>().createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passController.text,
                          name: nameController.text);
                    }else{
                      customSnackBar(context: context,msg:  AppString.confirmRules);
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              MySizedBox(height: 30),
              HaveOrNotHaveAcc(
                text1: AppString.haveAcc,
                text2: AppString.login,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
