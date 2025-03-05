import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/core/widgets/text_form_filed.dart';
import 'package:fruits_app/features/profile/presentation/manager/cubit/user_info_cubit.dart';

import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});
  static const routeName = "contact";

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final TextEditingController _controller=TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: AppString.contact,showNotification: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                defaultTextForm(controller: _controller, validator: (String?val){
                  if (val!.isEmpty) {
                    return AppString.validateMsg;
                  }                },maxLines: 10,hint: AppString.contact),
                const SizedBox(height: 20,),
                CustomButton(text: AppString.sendYourMsg, onPressed: (){
                  if(formKey.currentState!.validate()){
                    customSnackBar(
                        context: context,msg:  AppString.sendMsgSuccess, iconMsg: Icons.check_circle_outline,
                        iconColor:Colors.white);
                    _controller.clear();

                  }else{
                    autovalidateMode=AutovalidateMode.always;
                    setState(() {

                    });

                  }
                })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
