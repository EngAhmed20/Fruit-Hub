import 'dart:io';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
abstract class ImageRepo{
  Future<Either<Failure,String>> uploadImage(File image,String imageName);
  Future<Either<Failure,String>> updateImageLink({required String path, required String docId, required Map<String, dynamic> data});
  Future<Either<Failure, void>> uploadAndSaveImage({required File image,required String imageName,  String? docId,String? fieldName,String?fieldValue});
}