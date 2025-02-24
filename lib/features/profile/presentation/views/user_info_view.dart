import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:fruits_app/features/profile/presentation/manager/cubit/user_info_cubit.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/user_info_view_body.dart';

import '../../../../core/services/get_it_services.dart';
class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});
  static const routeName = 'UserInfoView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      appBar: buildAppBar(context, title: AppString.userInfo),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocProvider(
            create:(context)=>UserInfoCubit(getIt.get<AuthRepo>()),
            child: UserInfoViewBody()),
      )
    );
  }
}
