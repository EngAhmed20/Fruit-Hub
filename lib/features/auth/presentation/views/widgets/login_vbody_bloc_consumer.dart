import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/widgets/custom_snack_bar.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/login_view_body.dart';
import '../../../../../core/widgets/custom_progress_hub.dart';
import '../../login_cubit/login_cubit.dart';

class loginViewBodyBlocConsumer extends StatelessWidget {
  const loginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<loginCubit,loginState>(
        listener: (context,state){
          if(state is loginFailure){
            return customSnackBar(context, state.errorMessage);
          }
          if(state is loginSuccess){
          }
        },
        builder: (context,state){
          return CustomProgressHud(isLoading: state is loginLoading,circleColor: AppColors.lightPrimaryColor,
            child: LoginViewBody(),);
        }
    );
  }
}

