import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  UserModel( {required super.email, required super.name, required super.uId,super.imageUrl});

  factory UserModel.fromFirebaseUser(User user){
    return UserModel(
      email: user.email??'',
      name: user.displayName??'',
      uId: user.uid??'',
      imageUrl: user.photoURL??'',
    );
  }
  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
      email: json['email']?? '',
      name: json['name']?? '',
      uId: json['uId']?? '',
      imageUrl: json['imageUrl']?? ''
    );
  }
  factory UserModel.fromEntity(UserEntity entity){
    return UserModel(
      email: entity.email,
      name: entity.name,
      uId: entity.uId,
      imageUrl: entity.imageUrl,
    );
  }

  toMap(){
    return {
      'email': email,
      'name': name,
      'uId': uId,
      'imageUrl': imageUrl,
    };
  }


}