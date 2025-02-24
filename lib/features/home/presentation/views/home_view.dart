import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruits_app/core/repos/products_repo/products_repo.dart';
import 'package:fruits_app/core/services/get_it_services.dart';
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

