import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/domain/repo/forget_pass_repo.dart';
import 'package:meta/meta.dart';

part 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit(this.forgetPassRepo) : super(ChangePassInitial());
  final ForgetPassRepo forgetPassRepo;
  final TextEditingController findEmailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  changeValidate() {
    autovalidateMode = AutovalidateMode.always;
    emit(state);
  }

  checkIfEmailIsExist({required String email}) async {
    var result = await forgetPassRepo.sendUrlToChangePass(email: email);
    result.fold((failure) => emit(ChangePassFailure(msg: failure.message)),
        (success) => emit(ChangePassSuccess()));
  }
}
