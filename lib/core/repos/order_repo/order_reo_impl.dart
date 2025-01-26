import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/helper_function/get_user.dart';
import 'package:fruits_app/core/repos/order_repo/order_repo.dart';
import 'package:fruits_app/core/services/database_service.dart';
import 'package:fruits_app/core/utilis/backend_endpoint.dart';
import 'package:fruits_app/features/checkout/data/model/order_model.dart';
import 'package:fruits_app/features/checkout/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrderRepo{
  final DatabaseService firestoreService;

  OrderRepoImpl(this.firestoreService);
  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity}) async{
    try{
      await firestoreService.addData(path: BackendEndpoint.addOrder, data: OrderModel.fromEntity(orderEntity).toJson() );
      return const Right(null);
    }catch(e){
      print('error while add data${e}');
      return Left(ServerFailure(e.toString()));


    }
  }

}