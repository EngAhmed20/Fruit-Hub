import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/services/get_it_services.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_app/features/auth/presentation/signup_cubit/signup_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  static const routeName = "SignUp";
   SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(title: AppString.createNewAcc, context: context,),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}

