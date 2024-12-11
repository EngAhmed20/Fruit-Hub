import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:fruits_app/features/home/presentation/views/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const routeName="homeView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: HomeView()),
      bottomNavigationBar: CustomBottomNavBar(),





    );
  }
}
