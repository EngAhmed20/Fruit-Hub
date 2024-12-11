import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/product_cubit/products_cubit.dart';

import '../../../../../constant.dart';
import '../../../../../core/widgets/custom_serarch_filed.dart';
import 'best_selling_grid_view_bloc_builder.dart';
import 'best_selling_header.dart';
import 'custom_home_app_bar.dart';
import 'featured_list.dart';
import 'fruit_item_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Column(
            children: [
              const SizedBox(height: KVerticalPadding,),
              const CustomHomeAppBar(),
              const SizedBox(height: KVerticalPadding,),
              searchTextFiled(),
              const SizedBox(height:12,),
              FeaturedList(),
              const SizedBox(height: 12,),
              BestSellingHeader(),
              const SizedBox(height: 12,),
            ],
          ),),
          BestSellingGridViewBlocBuilder(),
        ],
      ),
    );
  }
}

