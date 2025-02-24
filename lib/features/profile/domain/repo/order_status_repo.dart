import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/features/profile/domain/entities/order_status_entity.dart';

abstract class OrdersStatusRepo{
  Future<Either<Failure,List<OrderStatusEntity>>> getOrdersStatus({required String uId});
}