

import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class StorageService{
  Future<String>uploadUserImage(File image,String imageName);

}