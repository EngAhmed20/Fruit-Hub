import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/helper_function/get_user.dart';
import 'package:fruits_app/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

import '../../../constant.dart';
import '../../../generated/assets.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial()){getUserName();}
  final ProductsRepo productsRepo;
  int productCount=0;
  late String name;
  late String userImage;
  bool isSearch=false;
  final TextEditingController searchController=TextEditingController();
List<ProductEntity> searchedProduct=[];

  getUserName(){
    name=getUser().name;
    emit(GetUserInfoSuccess());
    userImage=getUser().imageUrl??defaultUserImage;

  }
  void searchProducts({required String hintSearch})async{
    searchedProduct.clear();
    emit(SearchProductLoadingState());
    final result=await productsRepo.searchProducts(productName:hintSearch);
    result.fold((failure)=>emit(SearchProductFailureState(failure.message)),
        (products){

      for(var product in products){
        searchedProduct.add(product);
      }
      print(searchedProduct);
      emit(SearchProductSuccessState());
        });

  }
  String searchImg=Assets.imagesSearchNormal;
  void searchIcon()async{
    isSearch=!isSearch;
    print(isSearch);
    if(isSearch==false){
      searchImg=Assets.imagesSearchNormal;
      getProducts();
      //emit(SearchState());
    }
    else{
      searchImg=Assets.imagesCancelSearch;
      emit(SearchState());
    }


  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold((failure) => emit(ProductsError(failure.message)),
        (products) => emit(ProductsSuccess(products)));
  }
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold((failure) => emit(ProductsError(failure.message)),
        (products)  {

      productCount=products.length;
      emit(ProductsSuccess(products));
    });
  }
}
