import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/active_bottom_nav_item.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/inactive_bottom_nav_item.dart';

import '../../../domain/entities/bottom_nav_bar_entity.dart';

class NavBottomBarItem extends StatelessWidget {
  const NavBottomBarItem({super.key, required this.isSelected, required this.entity});
  final bool isSelected;
  final BottomNavBarEntity entity;

  @override
  Widget build(BuildContext context) {
    return isSelected?ActiveBottomNavItem(activeImg:entity.activeImg,text: entity.title,):InactiveBottomNavItem(inactiveImg:entity.inactiveImg);
  }
}
