import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed, this.textStyle, this.isLoading});
  final String text;
  final VoidCallback onPressed;
  final TextStyle?textStyle;
  final bool?isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 54,
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
              ),
            ),
            onPressed: onPressed, child:isLoading==true?Center(child: LoadingAnimationWidget.inkDrop(color:Colors.white, size:30)):Text(text,style:textStyle?? TextStyle(color: Colors.white),)));
  }
}
