import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utilis/app_string.dart';
import 'package:fruits_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:fruits_app/features/profile/presentation/manager/cubit/user_info_cubit.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utilis/app_colors.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/loading_animated_widget.dart';
import '../../../../../generated/assets.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileState>(builder: (context,state){
      var cubit=context.watch<ProfileCubit>();
      return Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: AppColors.secondartColor,
            child: state is ProfileImageUpdatingLoading?LoadingAnimatedWidget(context): CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.lightPrimaryColor,
              backgroundImage: NetworkImage(
                cubit.userImage,
              ),
            ),
          ),
          Positioned(
              bottom: -5,
              right: 0,
              child: CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.lightPrimaryColor,
                  child: IconButton(onPressed: ()async{
                   File? image= await pickFile();
                  await cubit.UploadProfileImage(image);
                   }, icon: const Icon(Icons.camera_alt_outlined,color: Colors.white),padding: EdgeInsets.all(2),))),
        ],
      );
    }, listener:(context,state){
      if (state is ProfileImageUpdatingError){
        customSnackBar(context: context, msg:AppString.otherException);


      }
    });
  }
}
Future <File?> pickFile()async{
try{
  final ImagePicker picker=ImagePicker();
  final XFile?image=await picker.pickImage(source: ImageSource.gallery);
  File?fileImage= File(image!.path);
  return fileImage;

}catch(e){
  print(e.toString());
}
}