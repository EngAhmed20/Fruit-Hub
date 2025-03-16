import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';

import '../../../../core/utilis/app_colors.dart';
import '../../../../core/utilis/app_style/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../profile/presentation/views/widgets/profile_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  static const routeName = "productDetails";
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            buildAppBar(context, title: product.name, showNotification: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16,),
                product_details_image(product: product),
                const SizedBox(height: 24,),
                Text(product.name,style: textStyle.Bold16,),
                const SizedBox(height: 4,),
                Text.rich(TextSpan(
                    children: [
                      TextSpan(text: '${product.price!} ',style: textStyle.Bold13.copyWith(color: AppColors.secondartColor)),
                      TextSpan(text: AppString.currency,style: textStyle.Bold13.copyWith(color: AppColors.secondartColor)),
                      TextSpan(text: ' / ',style: textStyle.Bold13.copyWith(color:AppColors.secondartColor)),
                      TextSpan(text: AppString.Quantity,style: textStyle.Bold13.copyWith(color: AppColors.lightSecondartColor))
                    ]
                )),
                const SizedBox(height: 10,),
                Row(children: [
                  SvgPicture.asset(Assets.imagesStar),
                  const SizedBox(width: 5,),
                  Text('${product.avgRating??0}'),
                  const SizedBox(width: 9,),
                  Text('(${product.ratingCount})',style: textStyle.Bold13,),
                ],),
                const SizedBox(height: 8,),
                Text(product.description,style: textStyle.regular16,),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: product_details_info_card(title: product.expirationMonths!.toString(),subTitle: AppString.validity,img: Assets.imagesCalendar,titleExtention: AppString.months,)),
                   const SizedBox(width: 8,),
                    const Expanded(child: product_details_info_card(title: AppString.percent,subTitle: AppString.organic,img: Assets.imagesOrganic)),
            
                ],),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: product_details_info_card(title: product.numOfCalories!.toString(),subTitle: AppString.numOfGram,img: Assets.imagesCalories,titleExtention: AppString.calories,)),
                    const SizedBox(width: 8,),
                    Expanded(child: product_details_info_card(title: '(${product.ratingCount})',subTitle: AppString.review,img: Assets.imagesFavourites,titleExtention: product.avgRating.toString(),)),
            
                  ],),
            const SizedBox(height: 16,),
            
              ],
            ),
          ),
        ));
  }
}

class product_details_image extends StatelessWidget {
  const product_details_image({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage(Assets.imagesDetailsBackground),
              fit: BoxFit.fill // Background image
              )),
      child: Center(
        // Ensures the image stays inside the container
        child: Image.network(
          product.imageUrl!,
          width: MediaQuery.of(context).size.width /
              2, // Makes it fill the container
          height: MediaQuery.of(context).size.height * 0.19,
          fit: BoxFit
              .contain, // Ensures the product image is visible without cropping
        ),
      ),
    );
  }
}

class product_details_info_card extends StatelessWidget {
  const product_details_info_card({
    super.key, required this.title, required this.subTitle, required this.img, this.titleExtention,
  });

  final String title;
  final String subTitle;
  final String img;
  final String? titleExtention;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffF1F1F5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child:ListTile(
        title: Row(
          children: [
            Text(title,style: textStyle.Bold16.copyWith(color: AppColors.primaryColor),),
            const SizedBox(width: 5,),
             if(titleExtention!=null)
              Text(titleExtention!,style: textStyle.semiBold13,)
          ],
        ),
        subtitle:  Text(subTitle,style: textStyle.semiBold13,),
        trailing: SvgPicture.asset(img),
      ),
    );
  }
}

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name),
      ],
    );
  }
}
