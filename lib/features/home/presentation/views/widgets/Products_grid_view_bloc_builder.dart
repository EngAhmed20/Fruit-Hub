import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper_function/dummy_product_entity.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'fruit_item_grid_view.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit,ProductsState>(
      builder: (context,state){
        if (state is ProductsSuccess) {
          return FruitItemGridView(products:state.products,);
        } else if (state is ProductsError) {
          return SliverToBoxAdapter(child: CustomErrorWidget(errorMessage: state.errorMessage,));
        }
        else{
          return Skeletonizer.sliver(child: FruitItemGridView(products: dummyProductList));
        }

      },
    );
  }
}