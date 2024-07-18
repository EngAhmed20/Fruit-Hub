import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/services/get_it_services.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_app/features/auth/presentation/login_cubit/login_cubit.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/login_vbody_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  static const routeName='Login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>loginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: customAppBar(context: context,title:AppString.login ,showIcon: false),
       body: loginViewBodyBlocConsumer(),
      ),
    );
  }
}

