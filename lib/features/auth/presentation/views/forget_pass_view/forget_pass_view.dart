import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/constant.dart';
import 'package:fruits_app/core/services/database_service.dart';
import 'package:fruits_app/core/services/get_it_services.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/core/utilis/validate.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/text_form_filed.dart';
import 'package:fruits_app/features/auth/domain/repo/forget_pass_repo.dart';
import 'package:fruits_app/features/auth/presentation/change_pass_cubit/change_pass_cubit.dart';
import 'package:fruits_app/features/auth/presentation/login_cubit/login_cubit.dart';
import '../../../../../core/services/firebase_Auth_services.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});
  static const String routeName='forgetPass';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ChangePassCubit(getIt.get<ForgetPassRepo>()),
      child: Scaffold(
        appBar:buildAppBar(context, title:'',showNotification:false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
          child: ForgetPassViewBody(),
        ),
      ),

    );
  }
}
class ForgetPassViewBody extends StatelessWidget {
   ForgetPassViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePassCubit,ChangePassState>(builder: (context,state){
      var cubit=context.read<ChangePassCubit>();
      return Form(
        key:cubit.formKey ,
        autovalidateMode: cubit.autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24,),
            const Text(AppString.searchForYourAccountTitle,style: textStyle.Bold19),
            const SizedBox(height: 12,),
            Text(AppString.searchForAccSubTitle,style: textStyle.semiBold16.copyWith(color: const Color(0xff616A6B)),),
            const SizedBox(height: 30,),
            defaultTextForm(controller: cubit.findEmailController, validator: (String?val){
                return validateEmail(val);
            },hint: AppString.email),
            const SizedBox(height: 25,),
            CustomButton(text: AppString.sendUrl, onPressed: (){
              if(cubit.formKey.currentState!.validate()){
                cubit.checkIfEmailIsExist(email: cubit.findEmailController.text);
              }else{
                cubit.changeValidate();
              }
            }),
          ],
        ),
      );

    }, listener: (context,state){
      if(state is ChangePassFailure){
        return customSnackBar(context: context,msg:state.msg);

      }
      if(state is ChangePassSuccess){
        customSnackBar(
            context: context,msg:  AppString.sendUrlSuccess, iconMsg: Icons.check_circle_outline,
            iconColor:Colors.white);
        Future.delayed(const Duration(seconds: 2),(){
          Navigator.pop(context);
        });

      }
    });
  }
}
