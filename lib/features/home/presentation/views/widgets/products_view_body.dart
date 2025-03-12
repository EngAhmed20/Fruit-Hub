import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/fruit_item.dart';
import 'package:fruits_app/core/widgets/loading_animated_widget.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/products_header.dart';

import '../../../../../constant.dart';
import '../../../../../core/widgets/custom_serarch_filed.dart';
import '../../../../../generated/assets.dart';
import 'Products_grid_view_bloc_builder.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<ProductsCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildAppBar(context,
                    title: AppString.productTitle,
                    showBackButton: false,
                    horizontal: 0),
                const SizedBox(
                  height: KVerticalPadding,
                ),
                searchTextFiled(),
                const SizedBox(
                  height: KVerticalPadding,
                ),
                ProductsHeader(
                  productCount: cubit.productCount,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          cubit.isSearch == false
              ? ProductsGridViewBlocBuilder()
              : SliverToBoxAdapter(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (cubit.searchController.text.isEmpty) {
                  return Center(child: Text(AppString.emptySearchHintText,style: textStyle.semiBold16,));
                } if (state is SearchProductLoadingState){
                  return LoadingAnimatedWidget(context);
                }
                if(state is SearchProductFailureState){
                  return Column(
                    children: [
                      SvgPicture.asset(Assets.imagesIllustrations),
                      const SizedBox(height: 5,),
                      Text(AppString.searchFailureText,style: textStyle.semiBold16.copyWith(color: const Color(0xff949D9E)),)
                    ],);

                }
                return Column(
                  children: List.generate(cubit.searchedProduct.length, (index) => SizedBox(
                      height:200,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: FruitItem(productEntity: cubit.searchedProduct[index]),
                      ))),
                );
              },
            ),
          )

        ],
      ),
    );
  }
}
