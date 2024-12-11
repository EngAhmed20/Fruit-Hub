import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';

import '../../../../core/utilis/app_string.dart';
import '../../../../generated/assets.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView ({super.key});
  static const  routeName='bestSellingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios),),
        title: const Text(AppString.bestSellerTitle,style: textStyle.Bold19,),
        centerTitle: true,
        actions: [Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
              padding:const EdgeInsets.all(6),
              decoration:const ShapeDecoration(shape:OvalBorder(),color: Color(0xffeef8ed)) ,
              child: SvgPicture.asset(Assets.imagesNotification)),
        ),]

      ),
      body: BestSellingViewBody(),
    );
  }
}
