import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/helper_function/get_user.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

import '../../../../../core/cubits/product_cubit/products_cubit.dart';
import '../../../../../core/utilis/app_colors.dart';
import '../../../../../generated/assets.dart';



class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProductsCubit,ProductsState>(builder:(context,state){
      var cubit=context.watch<ProductsCubit>();
      return ListTile(
        visualDensity: const VisualDensity(
          vertical: 1,
          horizontal: 0,
        ),
        contentPadding:EdgeInsets.zero,
        leading:CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.lightPrimaryColor,
          backgroundImage: NetworkImage(
            cubit.userImage,
          ),
        ),
        title: Text(AppString.homeAppBarTitle,style: textStyle.regular16.copyWith(color: Colors.grey),),
        subtitle: Text(cubit.name,style: textStyle.semiBold16,),
        trailing: Container(
            padding:const EdgeInsets.all(5),
            decoration:ShapeDecoration(shape:OvalBorder(),color: Color(0xffeef8ed)) ,
            child: SvgPicture.asset(Assets.imagesNotification)),
      );
    });
  }
}
