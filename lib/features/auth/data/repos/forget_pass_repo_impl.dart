import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/auth/domain/repo/forget_pass_repo.dart';

import '../../../../core/services/firebase_Auth_services.dart';

class ForgetPassRepoImpl implements ForgetPassRepo{
  final FirebaseAuthServices firebaseAuthServices;

  ForgetPassRepoImpl(this.firebaseAuthServices);

  @override
  Future<Either<Failure, void>> sendUrlToChangePass({required String email}) async{
    try{
      await firebaseAuthServices.sendPasswordResetEmail(email);
      return (Right(''));
    } catch(e){
    return Left(ServerFailure(AppString.otherException));

    }

  }

}