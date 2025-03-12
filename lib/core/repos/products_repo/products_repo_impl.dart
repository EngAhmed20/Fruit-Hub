import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/models/product_entity_model.dart';
import 'package:fruits_app/core/repos/products_repo/products_repo.dart';
import 'package:fruits_app/core/services/database_service.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/backend_endpoint.dart';

class ProductsRepoImpl extends ProductsRepo{
  final  DatabaseService databaseService;
  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async{
    try{
      var data=await databaseService.getData(path: BackendEndpoint.getProducts,query: {
        'orderBy': 'sellingCount',
        'limit': 10,
        'descending':true,
      }) as List<Map<String,dynamic>>;
      List<ProductEntity>products=data.map((e)=>ProductEntityModel.fromJson(e).toEntity()).toList();
      return right(products);

    }catch(e){
      return left(ServerFailure(AppString.getDataError));
    }
  }
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async{
    try {
      var data=await databaseService.getData(path: BackendEndpoint.getProducts)as List<Map<String,dynamic>>;
      List<ProductEntity> products=data.map((e)=>ProductEntityModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      print('get products failed${e}');
      return left(ServerFailure(AppString.getDataError));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> searchProducts({required String productName})async {
    try{
      var data=await  databaseService.getData(path: BackendEndpoint.getProducts,searchByLetter: true,query: {
        'filterBy': 'name',
        'filterValue':productName,
      })as List<Map<String,dynamic>>;
      if(data.isNotEmpty){
        List<ProductEntity>products=data.map((e)=>ProductEntityModel.fromJson(e).toEntity()).toList();
        print(products.length);
        return right(products);
      }else{
        return Left(ServerFailure(AppString.getDataError));
      }
    }catch(e){
      return Left(ServerFailure(AppString.getDataError));
    }
  }
}