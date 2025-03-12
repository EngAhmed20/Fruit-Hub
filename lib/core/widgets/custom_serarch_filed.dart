import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

import '../../generated/assets.dart';

class searchTextFiled extends StatelessWidget {
  const searchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          var cubit=context.watch<ProductsCubit>();
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor,
                    offset: Offset(0, 3),
                    blurRadius: 3,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: AppColors.lightPrimaryColor,
                    offset: Offset(3, 0),
                    blurRadius: 3,
                    spreadRadius: 0,
                  )
                ]),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  cursorColor: AppColors.primaryColor,
                  controller: cubit.searchController,
                  onTap: (){
                    cubit.searchIcon();
                  },
                  onChanged: (String? val){
                    if(cubit.searchController.text.isNotEmpty){
                      cubit.searchProducts(hintSearch: cubit.searchController.text);
                    }

                  },
                  style: textStyle.semiBold16.copyWith(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '${AppString.hintSearch} ',
                    hintStyle: textStyle.regular13
                        .copyWith(color: const Color(0xff949d9e)),
                    labelStyle: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                    suffixIcon: Container(
                        width: 20,
                        child: Center(
                            child: SvgPicture.asset(Assets.imagesFilter))),
                    prefixIcon: GestureDetector(
                      onTap: (){
                        cubit.searchIcon();
                      },
                      child: SizedBox(
                          width: 20,
                          child: Center(
                              child:
                                  SvgPicture.asset(cubit.searchImg,color: AppColors.lightPrimaryColor,width: 20,height: 21,))),
                    ),
                    border: _inputBorder(),
                    enabledBorder: _inputBorder(),
                    focusedBorder: _inputBorder(),
                  ),
                ),
              ),
            );});
  }
}

OutlineInputBorder _inputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.0,
      ));
}
