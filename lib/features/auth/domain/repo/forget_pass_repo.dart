import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';

abstract class ForgetPassRepo{
  Future<Either<Failure,void>> sendUrlToChangePass({required String email});
}