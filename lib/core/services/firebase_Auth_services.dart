import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_app/core/errors/exceptions.dart';
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
 Future <User> signInWithEmailAndPassword({required String email, required String password}) async{
   try{
     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
     return credential.user!;
   } on FirebaseException catch (e){
     log('Exception in FirebaseAuthServices.sign in with email and password :${e.toString()}');
     if(e.code == 'network-request-failed'){
       throw CustomException(message: AppString.networkExc);
     }
     if(e.code == 'user-not-found'){
       throw CustomException(message: AppString.invalidEmailOrPass);
     }
     if(e.code == 'wrong-password'){
       throw CustomException(message: AppString.passwordException);
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
}