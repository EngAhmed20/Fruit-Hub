import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/helper_function/get_user.dart';
import 'package:fruits_app/core/services/get_it_services.dart';
import 'package:fruits_app/features/profile/domain/repo/image_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../constant.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.imageRepo) : super(ProfileInitial()){inIt();}
  final ImageRepo imageRepo;
  String imageName=getUser().uId;
  String userId=getUser().uId;
  late String userImage;
  inIt(){
    userImage=getUser().imageUrl??defaultUserImage;
    print('hi');
    emit(IdentifyInitSuccess());
  }

  Future<void>UploadProfileImage(File? image)async {
    emit(ProfileImageUpdatingLoading());
    var result=await imageRepo.uploadAndSaveImage(image: image!, imageName: imageName,docId: getUser().uId);
    result.fold((failure)=>emit(ProfileImageUpdatingError()), (url){
     inIt();
      emit(ProfileImageUpdatingLoaded());});
  }
  
}
