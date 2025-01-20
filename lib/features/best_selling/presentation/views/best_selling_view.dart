import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';

import '../../../../core/utilis/app_string.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView ({super.key});
  static const  routeName='bestSellingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: AppString.bestSellerTitle),
      body: BestSellingViewBody(),
    );
  }
}
