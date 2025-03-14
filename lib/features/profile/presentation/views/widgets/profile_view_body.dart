import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/services/firebase_Auth_services.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/features/profile/presentation/views/user_info_view.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/about_view.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/contact_us_view.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/user_image_wiidget.dart';

import '../../../../../core/services/get_it_services.dart';
import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../generated/assets.dart';
import '../../../../auth/presentation/views/login_view.dart';
import '../../../domain/repo/image_repo.dart';
import '../../manager/cubit/profile_cubit.dart';
import '../track_your_order_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ProfileCubit(getIt.get<ImageRepo>()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildAppBar(context,
                  title: AppString.user,showBackButton:false,horizontal:0),
              const SizedBox(
                height: 15,
              ),
              const UserImageWidget(),
              const SizedBox(height: 20,),
              ProfileListTitle(title: AppString.userInfo,leadingIcon: Icons.person_outline,onTap: (){
                Navigator.pushNamed(context, UserInfoView.routeName);
              }),
              const SizedBox(height: 15,),
              ProfileListTitle(title: AppString.orderState,leadingIcon: Icons.shopping_cart_outlined,onTap: (){
                Navigator.pushNamed(context, TrackYourOrderView.routeName);
              }),
              const SizedBox(height: 15,),
              ProfileListTitle(title: AppString.about, leadingIcon: Icons.info_outline, onTap: (){
                Navigator.pushNamed(context, AboutView.routeName);
              }),
              const SizedBox(height: 15,),
              ProfileListTitle(title: AppString.contact, leadingIcon: Icons.contact_mail_outlined, onTap: (){
                Navigator.pushNamed(context, ContactUsView.routeName);

              }),
              const SizedBox(height: 15,),
              ProfileListTitle(title: AppString.logout, leadingIcon: Icons.logout, onTap: ()async{
                await FirebaseAuthServices().signOut();
                Navigator.pushReplacementNamed(context,LoginView.routeName);


              }),



            ],
          ),
        ),
      ),
    );
  }

  ListTile ProfileListTitle({required IconData leadingIcon,required String title,void Function()? onTap}) {
    return ListTile(
            leading:  Icon(leadingIcon,size: 30,color: Colors.red,),
            title:  Text(title,style: textStyle.Bold16,),
            contentPadding: EdgeInsets.zero,
            trailing:  const Icon(Icons.arrow_forward_ios,size: 20,),
            onTap: onTap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            splashColor:AppColors.primaryColor,

          );
  }
}

