import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomProgressHud extends StatelessWidget {
  const CustomProgressHud({super.key, required this.isLoading, required this.child, this.circleColor});
  final bool isLoading;
  final Widget child;
  final Color? circleColor;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(
        color: circleColor,
        strokeWidth: 4,
      ),
      child: child,color:Colors.white,blur: 1,) ;
  }
}
