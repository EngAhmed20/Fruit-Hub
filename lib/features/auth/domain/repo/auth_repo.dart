
import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPass(
      String email, String password, String name);
  Future<Either<Failure,UserEntity>> signinWithEmailAndPass(
      String email, String password);
  Future<Either<Failure,UserEntity>> signinWithGoogle();
  Future<Either<Failure, UserEntity>> signinWithFacebook();
  Future addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uid});
}
