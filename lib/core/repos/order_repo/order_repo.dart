import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';

import '../../../features/checkout/domain/entities/order_entity.dart';

abstract class OrderRepo{
Future<Either<Failure,void>>addOrder({required OrderEntity orderEntity});
}