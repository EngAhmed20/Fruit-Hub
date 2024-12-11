import 'package:flutter/material.dart';
import 'package:fruits_app/core/widgets/fruit_item.dart';

import '../../../../../core/entities/product_entity.dart';

class FruitItemGridView extends StatelessWidget {
  const FruitItemGridView({super.key, required this.products});
   final List <ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 163/210,
      crossAxisSpacing: 16,
      mainAxisSpacing: 8,
    ), itemBuilder: (context,index)=>FruitItem(productEntity: products[index]),itemCount: products.length,);
  }
}
