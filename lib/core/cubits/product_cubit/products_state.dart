part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}
class GetUserInfoSuccess extends ProductsState{

}
class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;
  ProductsSuccess(this.products);
}


class ProductsError extends ProductsState {
  final String errorMessage;
  ProductsError(this.errorMessage);
}
class SearchState extends ProductsState{}
class SearchProductLoadingState extends ProductsState{}
class SearchProductSuccessState extends ProductsState{}
class SearchProductFailureState extends ProductsState{
  final String errorMsg;
  SearchProductFailureState(this.errorMsg);
}