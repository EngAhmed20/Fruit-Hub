import 'dart:convert';

import 'package:fruits_app/constant.dart';
import 'package:fruits_app/core/services/shared_prefrences.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';

UserEntity getUser(){
  var jsonString=sharedPreferences.getString(KUserData);
  var userEntity=UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}