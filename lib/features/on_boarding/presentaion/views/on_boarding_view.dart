import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_app/constant.dart';
import 'package:fruits_app/core/services/shared_prefrences.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/features/auth/presentation/views/login_view.dart';
import 'package:fruits_app/features/on_boarding/presentaion/views/widgets/on_boarding_page_view.dart';

import '../../../../core/widgets/custom_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);
  static const routeName = 'onBoarding';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController pageController;
  int currentPage=0;
  @override
  void initState() {
    super.initState();
   pageController=PageController();
   pageController.addListener(() {
    setState(() {
      currentPage=pageController.page!.round();
    });
   });
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: OnBoardingPageView(pageController: pageController,)),
            DotsIndicator(dotsCount: 2,

              decorator: DotsDecorator(
                activeColor: AppColors.primaryColor,
                color: currentPage==1?AppColors.primaryColor:AppColors.primaryColor.withOpacity(0.5),
              ),

            ),
            SizedBox(height: 30,),
            Visibility(
              visible: currentPage == 1,
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: KHorizontalPadding),
                child: CustomButton(text: 'ابدأ الان',onPressed: (){
                  sharedPreferences.setBool(kisOnBoardingViewSee,true);
                  Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                },),
              ),
            ),
            SizedBox(height: 45,)

          ],
        ),
      ),
    );
  }
}
