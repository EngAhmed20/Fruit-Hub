import 'package:flutter/material.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.description,
      required this.price,
      required this.isSelected, this.onTap});
  final String title;
  final String description;
  final String price;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration:const  Duration(milliseconds: 300),

        padding: const EdgeInsets.only(
          left: 13,
          right: 28,
          top: 16,
          bottom: 16,
        ),
        // width: 343,
        // height: 81,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xff33d9d9d9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side:BorderSide(
              color: isSelected?AppColors.lightPrimaryColor:Colors.transparent
            ),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const ShapeDecoration(
                    shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xff949D9E)))),
                child: isSelected
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.lightPrimaryColor,
                        ),
                      )
                    : Container(),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textStyle.semiBold16,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    description,
                    style: textStyle.regular16
                        .copyWith(color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  price,
                  style: textStyle.Bold16.copyWith(
                      color: AppColors.lightPrimaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
