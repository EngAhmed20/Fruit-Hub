import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/constant.dart';
import 'package:fruits_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_app/core/repos/products_repo/products_repo.dart';
import 'package:fruits_app/core/services/get_it_services.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_app/features/home/presentation/views/widgets/featured_item.dart';

import '../../../../core/widgets/custom_serarch_filed.dart';
import '../../../../core/widgets/fruit_item.dart';
import 'widgets/featured_list.dart';
import 'widgets/fruit_item_grid_view.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ProductsCubit(
      getIt.get<ProductsRepo>())..getBestSellingProducts(),
    child:  HomeViewBody(),
    );
  }
}

