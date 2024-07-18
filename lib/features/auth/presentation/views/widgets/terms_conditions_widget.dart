import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/core/utilis/sized_box.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_check_box.dart';

class TermsAndConditionWidget extends StatefulWidget {
  const TermsAndConditionWidget({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;


  @override
  State<TermsAndConditionWidget> createState() => _TermsAndConditionWidgetState();
}

class _TermsAndConditionWidgetState extends State<TermsAndConditionWidget> {
  bool isTermsAccepted=false;


  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset:const Offset(6,0),
      child: Row(
        children: [
          CustomCheckBox(isChecked:isTermsAccepted,onChecked: (value){
            isTermsAccepted=value;
            widget.onChecked(value);
           setState(() {

           });
          },),
          MySizedBox(width: 16),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0,8),
              child: Text.rich(
                TextSpan(
                  children:[
                    TextSpan(text: AppString.terms1,style: textStyle.semiBold13),
                    TextSpan(text: AppString.terms2,style: textStyle.semiBold13.copyWith(color: AppColors.lightPrimaryColor)),

                  ]
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
