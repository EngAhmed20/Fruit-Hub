import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/core/errors/exceptions.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/backend_endpoint.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/services/database_service.dart';
import '../../../../core/services/firebase_Auth_services.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseService databaseService;

  AuthRepoImpl( {required this.firebaseAuthServices,required this.databaseService,});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPass(
      String email, String password, String name) async {
    User? user;
    try {
       user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity =UserEntity(email: email, name: name, uId: user.uid);
      await addUserData(user: userEntity,docId: user.uid);

      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    }catch(e){
      await deleteUser(user);

      log('Exception in auth implementation.create user with email and password :${e.toString()}');
      return left(ServerFailure(AppString.otherException));
    }
  }

  Future<void> deleteUser(User? user) async {
    if(user!=null){
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPass(String email, String password) async{
   try{
     var user = await firebaseAuthServices.signInWithEmailAndPassword(email: email, password: password);
     var userEntity=await getUserData(uid: user.uid);
     return Right(userEntity);

   }on CustomException catch (e){
     return left(ServerFailure(e.message));
   }catch(e){
     log('Exception in auth implementation.signin with email and password :${e.toString()}');
     return left(ServerFailure(AppString.otherException));
   }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async{
    User?user;
    try {
       user=await firebaseAuthServices.signInWithGoogle();
      var userEntity=UserModel.fromFirebaseUser(user);
      var isUserExist=await databaseService.checkIfDataExists(path: BackendEndpoint.checkUserExist, docId: user.uid);
      if(isUserExist){
        await getUserData(uid: user.uid);

      }else{
        await addUserData(user: userEntity,docId: user.uid);
      }
      return Right(userEntity);

    }catch (e){
      await deleteUser(user);
      log('Exception in auth implementation.signin with google :${e.toString()}');
      return left(ServerFailure(AppString.otherException));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithFacebook() async{
    User?user;
    try{
       user= await firebaseAuthServices.signInWithFacebook();
       var userEntity=UserModel.fromFirebaseUser(user);
       var isUserExist=await databaseService.checkIfDataExists(path: BackendEndpoint.checkUserExist, docId: user.uid);
       if(isUserExist){
         await getUserData(uid: user.uid);

       }else{
         await addUserData(user: userEntity,docId: user.uid);
       }
       return Right(userEntity);

    }catch(e){
      deleteUser(user);
      log('Exception in auth implementation.signin with facebook :${e.toString()}');
      return left(ServerFailure(AppString.otherException));
    }
  }

  @override
  Future addUserData({required UserEntity user,String? docId}) async{
    await databaseService.addData(path: BackendEndpoint.addUserData, data: user.toMap(),docId: docId);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async{
    var userData=await databaseService.getData(path: BackendEndpoint.getUserData, docId: uid);
    print('get data sucessfully');
    return UserModel.fromJson(userData);
  }
}
