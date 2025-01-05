import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/generated/assets.dart';

import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/utilis/app_style/app_text_styles.dart';

class ProductsHeader extends StatelessWidget {
  const ProductsHeader({super.key, required this.productCount});
  final int productCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text('${productCount} ${AppString.productsHeader}',style: textStyle.Bold16,),
        const Spacer(),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            child: SvgPicture.asset(Assets.imagesProductFilter))

      ],
    );

  }
}
