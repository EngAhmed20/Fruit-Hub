import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utilis/app_colors.dart';

Center LoadingAnimatedWidget(BuildContext context, {double? size}) {
  return Center(child: LoadingAnimationWidget.inkDrop(
    color: AppColors.primaryColor,
    size: size??MediaQuery.of(context).size.height*0.125,
  ),);
}
