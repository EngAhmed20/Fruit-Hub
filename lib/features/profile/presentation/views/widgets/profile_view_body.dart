import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../track_your_order_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAppBar(context,
                title: AppString.user,showBackButton:false,horizontal:0),
            const SizedBox(
              height: 25,
            ),
            ProfileListTitle(title: AppString.userInfo,leadingIcon: Icons.person_outline,onTap: (){}),
            const SizedBox(height: 15,),
            ProfileListTitle(title: AppString.orderState,leadingIcon: Icons.shopping_cart_outlined,onTap: (){
              Navigator.pushNamed(context, TrackYourOrderView.routeName);
            }),
            const SizedBox(height: 15,),
            ProfileListTitle(title: AppString.about, leadingIcon: Icons.info_outline, onTap: (){}),
            const SizedBox(height: 15,),
            ProfileListTitle(title: AppString.contact, leadingIcon: Icons.contact_mail_outlined, onTap: (){}),
            const SizedBox(height: 15,),
            ProfileListTitle(title: AppString.logout, leadingIcon: Icons.logout, onTap: (){}),
            


          ],
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
