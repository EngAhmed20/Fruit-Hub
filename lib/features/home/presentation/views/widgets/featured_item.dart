import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

import '../../../../../generated/assets.dart';
import 'featured_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width-32;
    return Container(
      width: width,
      
      child: AspectRatio(
        aspectRatio: 342/158,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                bottom: 0,
                left: 0,
                right: width*.4,
                top: 0,
                child: SvgPicture.asset(Assets.imagesPageViewImg2,fit: BoxFit.fill,)),
            Container(
              width: width*.5,
              decoration: const BoxDecoration(
                borderRadius:BorderRadius.only(topRight:Radius.circular(10),bottomRight: Radius.circular(10)),
                image: DecorationImage(image: svg.Svg(Assets.imagesFeaturedItemBackground),fit: BoxFit.fill),

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const SizedBox(height: 25,),
                  Text(AppString.featuredItemTitle,style: textStyle.regular16.copyWith(color: Colors.white),),
                  const Spacer(),
                  Text(AppString.featuredItemSubTitle, style: textStyle.Bold19.copyWith(color: Colors.white),),
                 const  SizedBox(height: 11,),
                  FeaturedButton(onPressed: (){},),
                  const SizedBox(height: 33,),
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }
}
