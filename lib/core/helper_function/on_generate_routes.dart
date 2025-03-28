import 'package:flutter/material.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/features/auth/presentation/views/login_view.dart';
import 'package:fruits_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_app/features/best_selling/presentation/views/best_selling_view.dart';
import 'package:fruits_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_app/features/home/presentation/views/main_view.dart';
import 'package:fruits_app/features/profile/presentation/views/user_info_view.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/about_view.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/contact_us_view.dart';
import 'package:fruits_app/features/prouct_details/presentation/view/product_details_view.dart';
import 'package:fruits_app/features/splash/presentation/views/splash_view.dart';
import '../../features/auth/presentation/views/forget_pass_view/forget_pass_view.dart';
import '../../features/cart/domain/entities/cart_entities.dart';
import '../../features/on_boarding/presentaion/views/on_boarding_view.dart';
import '../../features/profile/presentation/views/track_your_order_view.dart';

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
    case MainView.routeName:
     return  PageRouteBuilder(
       settings: settings,
       pageBuilder: (context, animation, secondaryAnimation) => MainView(),
       transitionsBuilder: (context, animation, secondaryAnimation, child) {
         const begin = Offset(0.0, 1.0); // الحركة من الأسفل للأعلى
         const end = Offset.zero;
         const curve = Curves.easeInOut;

         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
         var offsetAnimation = animation.drive(tween);

         return SlideTransition(
           position: offsetAnimation,
           child: child,
         );
       },
     );
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => BestSellingView());
    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (_)=>CheckoutView(
        cartItems:settings.arguments as CartEntities,
      ));
    case TrackYourOrderView.routeName:
      return MaterialPageRoute(builder: (_)=>TrackYourOrderView());
    case UserInfoView.routeName:
      return MaterialPageRoute(builder: (_)=>UserInfoView());
    case AboutView.routeName:
      return MaterialPageRoute(builder: (_)=>AboutView());
    case ContactUsView.routeName:
      return MaterialPageRoute(builder: (_)=>ContactUsView());
    case ProductDetailsView.routeName:
      return MaterialPageRoute(builder: (_)=>ProductDetailsView(
        product: settings.arguments as ProductEntity,
      ));
    case ForgetPassView.routeName:
      return MaterialPageRoute(builder: (_)=>ForgetPassView(
      ));
      // Add more routes here
    default:
      return MaterialPageRoute(builder: (_) => Scaffold());

  }
}
