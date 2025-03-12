import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import 'Products_grid_view_bloc_builder.dart';
import 'best_selling_header.dart';
import 'custom_home_app_bar.dart';
import 'featured_list.dart';
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
            //  searchTextFiled(),
              //const SizedBox(height:12,),
              FeaturedList(),
              const SizedBox(height: 12,),
              BestSellingHeader(),
              const SizedBox(height: 12,),
            ],
          ),),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}

