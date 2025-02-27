import 'dart:io';

import 'package:dartz/dartz_unsafe.dart';
import 'package:fruits_app/core/services/storage_service.dart';
import 'package:fruits_app/core/utilis/backend_endpoint.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class SupabaseStorage implements StorageService{
  @override
  Future<String> uploadUserImage(File image, String imageName) async{
   try{
     final imageExtension = p.extension(image.path);
     final fileName = imageName+imageExtension;

     final bucket=Supabase.instance.client.storage.from(BackendEndpoint.usersImage);
     //await bucket.remove([fileName]);
     await bucket.update(fileName,image);
     final imageUrl=await bucket.getPublicUrl(fileName);
     return imageUrl;
   }catch(e){
     print('Error uploading image: $e');
     return 'null';
   }
  }

}