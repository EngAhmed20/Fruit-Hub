import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/services/shared_prefrences.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

import '../../../../../constant.dart';
import '../../../../auth/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  PageViewItem({
    Key? key,
    required this.img,
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
    required this.isVisible,
  }) : super(key: key);
  final String img, backgroundImage, subTitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height *0.5,
          child: Stack(
            children: [
              Positioned.fill(child: SvgPicture.asset(backgroundImage,fit: BoxFit.fill,)),
              Positioned(bottom: 0,left: 0,right: 0,
                  child: SvgPicture.asset(img)),
               Visibility(visible: isVisible,
                   child: TextButton(onPressed: (){
                     sharedPreferences.setBool(kisOnBoardingViewSee,true);
                     Navigator.of(context).pushReplacementNamed(LoginView.routeName);

                   }, child:Text('تخط',style: textStyle.regular13
                   .copyWith(color: Color(0xff949d9e))))),


            ],
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        title,
        SizedBox(height: 24,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(subTitle,textAlign: TextAlign.center,style: textStyle.semiBold13
            .copyWith(color: Color(0xff4e5456)),),
        ),

      ],
    );
  }
}
