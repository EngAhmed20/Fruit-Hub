import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/services/database_service.dart';
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
  Future<Either<Failure, void>> updateImageLink({required String path, required String docId, required Map<String, dynamic> data})async {
   try{
     await databaseService.updateData(path: path, docId: docId, data: data);
     return const Right(null);

   }catch(e){
      return Left(ServerFailure(e.toString()));

   }


  }
  Future<Either<Failure, void>> uploadAndSaveImage({required File image,required String imageName, required String docId,}) async
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
          data: {"imageUrl": imageUrl},
        );

        return updateResult.fold(
              (failure) {
            print("Failed to update image link: ${failure.message}");
            return Left(failure);
          },
              (_) async{
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

