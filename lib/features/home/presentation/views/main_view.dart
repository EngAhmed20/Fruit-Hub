import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'widgets/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName="mainView";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CartCubit(),
      child: Scaffold(
        body: SafeArea(child: MainViewBody(currentViewIndex: currentIndex,)),
        bottomNavigationBar: CustomBottomNavBar(onIndexChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },),





      ),
    );
  }
}
