import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../signup_cubit/signup_cubit.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit,SignupState>(
      listener: (context,state){
        if(state is SignupFailure) {
          customSnackBar(context, state.message);
        }
         if(state is SignupSuccess){
           customSnackBar(context, AppString.success);
           // Navigate to home page
           //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
         }
      },
      builder: (context,state){
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading?true:false,
          child:  SignUpViewBody(),
        );
      },
    );
  }

}