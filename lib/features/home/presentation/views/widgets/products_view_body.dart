import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/products_header.dart';

import '../../../../../constant.dart';
import '../../../../../core/widgets/custom_serarch_filed.dart';
import 'Products_grid_view_bloc_builder.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<ProductsCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Column(
            children: [
              const SizedBox(height: KVerticalPadding,),
              CustomAppBar(title: AppString.productTitle,showBackButton: false,),
              const SizedBox(height: KVerticalPadding,),
              searchTextFiled(),
              const SizedBox(height: KVerticalPadding,),
              ProductsHeader(productCount: cubit.productCount,),
              const SizedBox(height: 16,),
            ],
          ),),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );

  }
}
