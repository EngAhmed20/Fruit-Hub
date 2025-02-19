import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/utilis/app_colors.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/app_style/app_text_styles.dart';
import 'package:fruits_app/features/cart/presentation/manager/cubit/cart_cubit.dart';


class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Container(

        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfff3f5f7)
      ),
      child:Stack(
        children: [
          Positioned(top:0,right:0,child: IconButton(onPressed: (){},icon: const Icon(Icons.favorite_border_outlined),)),
          Positioned.fill(child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height:20,),

              Expanded(child: Image.network(productEntity.imageUrl!,)),
              ListTile(
                title: Text(productEntity.name,style: textStyle.semiBold16,),
                contentPadding: EdgeInsets.symmetric(horizontal:10 ),
                subtitle: Text.rich(TextSpan(
                  children: [
                    TextSpan(text: '${productEntity.price!}',style: textStyle.Bold13.copyWith(color: AppColors.secondartColor)),
                    TextSpan(text: ' / ',style: textStyle.Bold13.copyWith(color:AppColors.secondartColor)),
                    TextSpan(text: AppString.Quantity,style: textStyle.Bold13.copyWith(color: AppColors.lightSecondartColor))
                  ]
                )),
                trailing: GestureDetector(
                  onTap: (){
                    context.read<CartCubit>().addCartItem(productEntity);
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.add,color: Colors.white,),
                  ),
                ),
              ),

            ],
          )),
        ],
      )
    );
  }
}
