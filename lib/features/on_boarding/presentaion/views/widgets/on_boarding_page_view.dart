import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/features/on_boarding/presentaion/views/widgets/page_view_item.dart';

import '../../../../../core/utilis/app_images.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({ required this.pageController});
  final  PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: (pageController.hasClients?pageController.page!.round():0)==0,
            img: Assets.imagesPageViewImg1,
            backgroundImage: Assets.imagesPageViewBackGround1,
            subTitle:'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             Text('مرحبًا بك في ',style: textStyle.Bold23,),
                Text(' HUB',style: textStyle.Bold23.copyWith(color: AppColors.secondartColor),),
                Text('Fruit',style: textStyle.Bold23.copyWith(
                  color: AppColors.primaryColor,
                ),),
            ],)),
        PageViewItem(
          isVisible: false,
          img: Assets.imagesPageViewImg2,
            backgroundImage: Assets.imagesPageViewBackGround2,
            subTitle:'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            title:const  Text('ابحث وتسوق',style: textStyle.Bold23),
        ),

      ],
    );
  }
}
