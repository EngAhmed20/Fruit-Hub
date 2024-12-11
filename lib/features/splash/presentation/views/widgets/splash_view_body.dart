
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/services/firebase_Auth_services.dart';
import 'package:fruits_app/core/services/shared_prefrences.dart';
import 'package:fruits_app/features/on_boarding/presentaion/views/on_boarding_view.dart';
import '../../../../../constant.dart';
import '../../../../../generated/assets.dart';
import '../../../../auth/presentation/views/login_view.dart';
import '../../../../home/presentation/views/main_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
  executeNavigation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment:   MainAxisAlignment.end,
            children:[ SvgPicture.asset(Assets.imagesPlant)]),
        SvgPicture.asset(Assets.imagesLogo),
        SvgPicture.asset(Assets.imagesSplashBottom,fit: BoxFit.fill,),

      ],

    );
  }
  void executeNavigation() {
    Future.delayed(const Duration(seconds: 3),(){
     var Nav= sharedPreferences.getBool(kisOnBoardingViewSee);
      if(Nav==true) {
        if(FirebaseAuthServices().isUserLoggedIn()==true){
            Navigator.pushReplacementNamed(context,MainView.routeName);
        }else{
          Navigator.pushReplacementNamed(context,LoginView.routeName);

        }

      }else
        {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }

    });
  }
}


