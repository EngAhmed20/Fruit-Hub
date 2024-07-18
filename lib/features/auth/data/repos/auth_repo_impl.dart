import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/exceptions.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/services/firebase_Auth_services.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({required this.firebaseAuthServices});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPass(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }catch(e){
      log('Exception in auth implementation.create user with email and password :${e.toString()}');
      return left(ServerFailure(AppString.otherException));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPass(String email, String password) async{
   try{
     var user = await firebaseAuthServices.signInWithEmailAndPassword(email: email, password: password);
     return Right(UserModel.fromFirebaseUser(user));

   }on CustomException catch (e){
     return left(ServerFailure(e.message));
   }catch(e){
     log('Exception in auth implementation.signin with email and password :${e.toString()}');
     return left(ServerFailure(AppString.otherException));
   }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async{
    try {
      var user=await firebaseAuthServices.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));

    }catch (e){
      log('Exception in auth implementation.signin with google :${e.toString()}');
      return left(ServerFailure(AppString.otherException));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithFacebook() async{
    try{
      var user= await firebaseAuthServices.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));

    }catch(e){
      log('Exception in auth implementation.signin with facebook :${e.toString()}');
      return left(ServerFailure(AppString.otherException));
    }
  }
}
