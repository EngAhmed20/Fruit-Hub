import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/constant.dart';
import 'package:fruits_app/core/errors/exceptions.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/helper_function/get_user.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/backend_endpoint.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/database_service.dart';
import '../../../../core/services/firebase_Auth_services.dart';
import '../../../../core/services/shared_prefrences.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.firebaseAuthServices,
    required this.databaseService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPass(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(email: email, name: name, uId: user.uid,imageUrl: defaultUserImage);
      await addUserData(user: userEntity, docId: user.uid);

      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);

      log('Exception in auth implementation.create user with email and password :${e.toString()}');
      return left(ServerFailure(AppString.otherException));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> updateUserData(
      {String? newEmail, String? newName, String? newPassword,String? currentPassword}) async {
    try {
      //get current user data
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return left(ServerFailure(AppString.noAuthUserFound));
      }

      String currentUserUid = user.uid;
      UserEntity currentUserData = await getUserData(uid: currentUserUid);

      if (newPassword != null && newPassword.isNotEmpty&&currentPassword != null&&currentPassword.isNotEmpty) {
        final passwordUpdateResult =await firebaseAuthServices.reauthenticateAndUpdatePassword(newPassword: newPassword,currentPassword: currentPassword,);
        if(passwordUpdateResult.isLeft()){

         return passwordUpdateResult.fold((failure)=>left(ServerFailure(failure.message)), (r){return left(ServerFailure('k'));});
        }

        }

      UserEntity newUserData=UserEntity(email: currentUserData.email,
          name: newName??currentUserData.name, uId: currentUserUid);
      await addUserData(user: newUserData,docId: currentUserUid);
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      getUser();
      return Right(userEntity);
    } catch (e) {
      log('Exception in auth implementation.updateUserData :${e.toString()}');
      return left(ServerFailure(AppString.otherException));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPass(
      String email, String password) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in auth implementation.signin with email and password :${e.toString()}');
      return left(ServerFailure(AppString.otherException));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);

      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.checkUserExist, docId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity, docId: user.uid);
      }
      return Right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in auth implementation.signin with google :${e.toString()}');
      return left(ServerFailure(AppString.otherException));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);

      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.checkUserExist, docId: user.uid);
      if (isUserExist) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity, docId: user.uid);
      }
      return Right(userEntity);
    } catch (e) {
      deleteUser(user);
      log('Exception in auth implementation.signin with facebook :${e.toString()}');
      return left(ServerFailure(AppString.otherException));
    }
  }

  @override
  Future addUserData({required UserEntity user, String? docId}) async {
    await databaseService.addData(
        path: BackendEndpoint.addUserData,
        data: UserModel.fromEntity(user).toMap(),
        docId: docId);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoint.getUserData, docId: uid);
    print('get data sucessfully');
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await sharedPreferences.setString(KUserData, jsonData);
  }
}
