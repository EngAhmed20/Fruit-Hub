import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/presentation/views/login_view.dart';
import 'package:fruits_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_app/features/splash/presentation/views/splash_view.dart';

import '../../features/on_boarding/presentaion/views/on_boarding_view.dart';

Route<dynamic> onGenrateRoute(RouteSettings settings){
  switch(settings.name){
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => SignUpView());

    default:
      return MaterialPageRoute(builder: (_) => Scaffold());

  }
}
