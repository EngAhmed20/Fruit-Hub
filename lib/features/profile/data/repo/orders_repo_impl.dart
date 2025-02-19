import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/services/database_service.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/backend_endpoint.dart';
import 'package:fruits_app/features/profile/data/model/order_status_model.dart';
import 'package:fruits_app/features/profile/domain/entities/order_status_entity.dart';
import 'package:fruits_app/features/profile/domain/repo/order_status_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService firestoreService;

  OrdersRepoImpl(this.firestoreService);

  @override
  Future<Either<Failure, List<OrderStatusEntity>>> getOrdersStatus() async {
    try {
      var data = await firestoreService.getData(
              path: BackendEndpoint.addOrder,
              query: {'orderBy': 'date', 'descending': true})
          as List<Map<String, dynamic>>;
      if (data.isNotEmpty) {
        List<OrderStatusEntity> orders = data
            .map((order) => OrderStatusModel.fromJson(order).toEntity())
            .toList();
        print('succcces track');
        return Right(orders);
      } else {
        return Left(ServerFailure(AppString.noOrdersYet));
      }
    } catch (e) {
      return Left(ServerFailure(AppString.getDataError));
    }
  }
}
