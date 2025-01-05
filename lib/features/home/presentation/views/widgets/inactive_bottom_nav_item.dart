import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InactiveBottomNavItem extends StatelessWidget {
  const InactiveBottomNavItem({super.key, required this.inactiveImg});
  final String inactiveImg;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: SvgPicture.asset(inactiveImg,width: 30,));
  }

}
