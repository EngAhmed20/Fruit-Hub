import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/services/database_service.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/core/utilis/backend_endpoint.dart';
import 'package:fruits_app/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/storage_service.dart';
import '../../domain/repo/image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageService storageService;
  final DatabaseService databaseService;
  final AuthRepo authRepo;

  ImageRepoImpl(this.storageService, this.databaseService, this.authRepo);

  @override
  Future<Either<Failure, String>> uploadImage(File image,String imageName) async {
    try {
      String imageUrl = await storageService.uploadUserImage(image,imageName);
      print(imageUrl);
      return Right(imageUrl);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateImageLink({required String path,  String? docId, required Map<String, dynamic> data,String? fieldName, // اسم الحقل الذي سيتم البحث به
    dynamic fieldValue,})async {
   try{
     String? DocId =await databaseService.updateData(path: path,fieldName:fieldName,fieldValue: fieldValue,docId: docId, data: data);
     if(DocId!=null){
       return Right(DocId);
     }else{
       return Left(ServerFailure(AppString.otherException));
     }
   }catch(e){
      return Left(ServerFailure(e.toString()));

   }


  }
  Future<Either<Failure, void>> uploadAndSaveImage({required File image,required String imageName,  String? docId,String? fieldName,String?fieldValue}) async
  {
    // رفع الصورة والحصول على الرابط
    final uploadResult = await uploadImage(image, imageName);

    return uploadResult.fold(
          (failure) {
        print("Upload failed: ${failure.message}");
        return Left(failure);
      },
          (imageUrl) async {
        // تحديث الرابط في قاعدة البيانات
        final updateResult = await updateImageLink(
          path: BackendEndpoint.addUserData,
          docId: docId,
          fieldName: fieldName,
          fieldValue: fieldValue,
          data: {"imageUrl": imageUrl},
        );

        return updateResult.fold(
              (failure) {
            print("Failed to update image link: ${failure.message}");
            return Left(failure);
          },
              (docId) async{
            print("Image uploaded and link updated successfully");
            var userEntity = await authRepo.getUserData(uid:docId);
            await authRepo.saveUserData(user: userEntity);
            return const Right(null);
          },
        );
      },
    );
  }
}

