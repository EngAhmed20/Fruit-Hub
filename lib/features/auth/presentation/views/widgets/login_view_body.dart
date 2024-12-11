import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/core/utilis/sized_box.dart';
import 'package:fruits_app/features/auth/presentation/login_cubit/login_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/sign_up_view.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/assets.dart';
import 'have_not_acc.dart';
import 'or_divider.dart';
import '../../../../../core/widgets/text_form_filed.dart';
import 'custm_login_icon.dart';

class LoginViewBody extends StatefulWidget {
  LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              MySizedBox(
                height: 30,
              ),
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
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return AppString.validatePassword;
                    }
                  },
                  hint: AppString.password,
                  ispass: loginCubit.get(context).isHidePass,
                  sufixpress: (){loginCubit.get(context).changeVisablity();},
                  suficon:loginCubit.get(context).sufIcon),
              MySizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                      onTap: () {
                        print('forget_page');
                      },
                      child: Text(
                        AppString.forgetPass,
                        style: textStyle.semiBold13
                            .copyWith(color: AppColors.lightPrimaryColor),
                      ))),
              MySizedBox(height: 30),
              CustomButton(
                text: AppString.login,
                textStyle: textStyle.semiBold16.copyWith(color: Colors.white),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    await loginCubit
                        .get(context)
                        .loginUser(emailController.text, passController.text);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              MySizedBox(
                height: 30,
              ),
              HaveOrNotHaveAcc(
                text1: AppString.dontHaveAcc,
                text2: AppString.createAcc,
                onTap: () {
                  Navigator.of(context).pushNamed(SignUpView.routeName);
                },
              ),
              MySizedBox(
                height: 30,
              ),
              OrDivider(),
              MySizedBox(height: 30),
              CustomLoginIcon(
                icon: SvgPicture.asset(Assets.imagesFacebookIcon),
                text: AppString.loginWithFacebook,
                onPressed: ()async {
                  await loginCubit.get(context).loginWithFacebook();

                },
              ),
              MySizedBox(height: 15),
              CustomLoginIcon(
                icon: SvgPicture.asset(
                  Assets.imagesGoogleIcon,
                ),
                text: AppString.loginWithGoogle,
                onPressed: ()async{
                  await loginCubit.get(context).loginWithGoogle();
                },

              ),
              MySizedBox(height: 15),
              /*CustomLoginIcon(
                icon: SvgPicture.asset(Assets.appleLogo),
                text: AppString.loginWithApple,
                onPressed: (){
                },

              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
