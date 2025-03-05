import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/profile/presentation/views/widgets/dev_info_widget.dart';
class AboutView extends StatelessWidget {
  const AboutView({super.key});
  static const routeName = "about";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: AppString.about,showNotification: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  AppString.aboutAsTitle,
                  style: textStyle.Bold23.copyWith(color: AppColors.primaryColor)
                ),
              ),
              const SizedBox(height: 10),
              Text(AppString.aboutAsDesc,style: textStyle.semiBold16.copyWith(color: AppColors.secondartColor),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                AppString.whyUs,
                style: textStyle.Bold19,
              ),
             const  SizedBox(height: 10),
              _buildFeatureItem(AppString.whyUsItem1),
              _buildFeatureItem(AppString.whyUsItem2),
              _buildFeatureItem(AppString.whyUsItem3),
              _buildFeatureItem(AppString.whyUsItem4),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  AppString.Thk,
                  style: textStyle.Bold19.copyWith(color: AppColors.primaryColor),
                ),
              ),
             const  SizedBox(height: 20),
              const Divider(thickness: 1),
              const SizedBox(height: 20),
              BuildDeveloperInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: textStyle.semiBold16
      ),
    );
  }

}
