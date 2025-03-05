import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/utilis/app_style/app_text_styles.dart';
import '../../../../../generated/assets.dart';

Widget BuildDeveloperInfo() {
  return Column(
    children: [
      const CircleAvatar(
        radius: 60,
        backgroundColor: AppColors.primaryColor,
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(Assets.imagesDeveloper), // تأكد من إضافة صورة المبرمج داخل assets
        ),
      ),
      const SizedBox(height: 10),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppString.dev,
            style:textStyle.Bold19,
          ),
          Text(AppString.devName,style: textStyle.Bold19,)
        ],
      ),
      const  SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialIcon(
            icon: FontAwesomeIcons.github,
            url: 'https://github.com/EngAhmed20/',
            color: const Color(0xFF181717), // GitHub black
          ),
          const SizedBox(width: 20),
          _buildSocialIcon(
            icon: FontAwesomeIcons.envelope, // Gmail icon
            url: 'ahmed2012muhammad@gmail.com',
            launchEmail: true,
            color: const Color(0xFFDB4437), // Gmail Red
          ),
        ],
      ),

    ],
  );
}

void _launchURL(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }

}
void _launchEmail(String email) async {
  try {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'استفسار حول التطبيق',
        'body': 'مرحبًا، أريد معرفة المزيد عن تطبيق Fruits App.',
      },
    );

    if (await launchUrl(emailUri)==true) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'تعذر فتح البريد الإلكتروني: التطبيق غير متاح.';
    }
  } catch (e) {
    print('خطأ أثناء محاولة فتح البريد: $e');
  }
}

Widget _buildSocialIcon({required IconData icon, required String url, required Color color,bool launchEmail=false}) {
  return GestureDetector(
    onTap: () => launchEmail?_launchEmail(url):_launchURL(url),
    child: Icon(icon, size: 35, color: color),
  );
}