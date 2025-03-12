
import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/errors/failure.dart';

abstract class ProductsRepo{
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
  Future<Either<Failure, List<ProductEntity>>> searchProducts({required String productName});

}