import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_app/core/errors/exceptions.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:google_sign_in/google_sign_in.dart';
class FirebaseAuthServices{
 Future <User>createUserWithEmailAndPassword({required String email,required String password})async
 {
   try {
     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: email,
       password: password,
     );
     return credential.user!;
   } on FirebaseAuthException catch (e) {
     log('Exception in FirebaseAuthServices.create user with email and password :${e.toString()}');
     if (e.code == 'network-request-failed') {
       throw CustomException(message: AppString.networkExc);
     }
     if (e.code == 'weak-password') {
       throw CustomException(message:AppString.passwordException);
     } else if (e.code == 'email-already-in-use') {
       throw CustomException(message: AppString.emailException);
     }else{
       throw CustomException(message: AppString.otherException);
     }
   } catch (e) {
     log('Exception in FirebaseAuthServices.create user with email and password :${e.toString()}');

     throw CustomException(message: AppString.otherException);

   }

 }
 /*Future<String> updateUserCredentials({String? newEmail, String? newPassword}) async {
   try {
     User? user = FirebaseAuth.instance.currentUser;


       //await user?.sendEmailVerification();



     if (user == null) {
       throw CustomException(message: "No authenticated user found.");
     }

     if (newEmail != null && newEmail.isNotEmpty) {

        await user.updateEmail(newEmail);

     }

     if (newPassword != null && newPassword.isNotEmpty) {
       await user.updatePassword(newPassword);
     }

     // إرجاع UID الخاص بالمستخدم بعد التحديث
     return user.uid;
   } on FirebaseAuthException catch (e) {
     log('Exception in FirebaseAuthServices.updateUserCredentials: ${e.toString()}');

     if (e.code == 'requires-recent-login') {
       throw CustomException(
           message: "You need to reauthenticate before changing your credentials.");
     }

     throw CustomException(message: "Failed to update credentials.");
   }
 }*/
 Future<Either<Failure, void>>reauthenticateAndUpdatePassword(
     {required String newPassword,required String currentPassword}) async {
   User? user = FirebaseAuth.instance.currentUser;

   if (user != null && user.email != null) {
     try {
       AuthCredential credential = EmailAuthProvider.credential(
         email: user.email!,
         password: currentPassword,
       );

       await user.reauthenticateWithCredential(credential);

       await user.updatePassword(newPassword);
       if (kDebugMode) {
         print(AppString.updatePassSuccess);
       }
       return const Right(null);
     } on FirebaseAuthException catch (e) {
       if (e.code == 'weak-password') {
         if (kDebugMode) {
           print(AppString.weekPassword);
         }
         return left(ServerFailure(AppString.weekPassword));

       } else if (e.code == 'requires-recent-login') {
         if (kDebugMode) {
           print(AppString.requireReLogin);
         }
         return left(ServerFailure(AppString.requireReLogin));


       } else {
         if (kDebugMode) {
           print("❌ خطأ: ${e.message}");
         }
         return left(ServerFailure(e.message ?? AppString.otherException));

       }
     }
   } else {
     print(AppString.noAuthUserFound);
     return left(ServerFailure(AppString.otherException));

   }
 }
 Future <User> signInWithEmailAndPassword({required String email, required String password}) async{
   try{
     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
     return credential.user!;
   } on FirebaseException catch (e){
     log('Exception in FirebaseAuthServices.sign in with email and password :${e.toString()}and code is ${e.code}');
     if(e.code == 'network-request-failed'){
       throw CustomException(message: AppString.networkExc);
     }
     else if(e.code == 'user-not-found'){
       throw CustomException(message: AppString.invalidEmailOrPass);
     }
     else if(e.code == 'user-not-found'){
       throw CustomException(message: AppString.invalidEmailOrPass);
     }
     else if(e.code == 'invalid-credential'){
       throw CustomException(message: AppString.invalidEmailOrPass);
     }
     else{
       throw CustomException(message: AppString.otherException);
     }
   } catch (e) {
     log('Exception in FirebaseAuthServices.sign in user with email and password :${e.toString()}');

     throw CustomException(message: AppString.otherException);

   }
 }
 Future<User> signInWithGoogle() async {
   // Trigger the authentication flow
   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

   // Obtain the auth details from the request
   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

   // Create a new credential
   final credential = GoogleAuthProvider.credential(
     accessToken: googleAuth?.accessToken,
     idToken: googleAuth?.idToken,
   );

   // Once signed in, return the UserCredential
   return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
 }
 Future<User> signInWithFacebook() async {
   final LoginResult loginResult = await FacebookAuth.instance.login();

   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

   // Once signed in, return the UserCredential
   return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
 }
 Future<void>deleteUser()async{
   await FirebaseAuth.instance.currentUser!.delete();
 }
 bool isUserLoggedIn(){
   return  FirebaseAuth.instance.currentUser!= null;
 }
 Future<void> signOut(){
   return FirebaseAuth.instance.signOut();

 }

}