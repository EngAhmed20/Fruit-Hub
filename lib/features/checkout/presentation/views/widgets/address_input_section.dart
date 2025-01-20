import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/constant.dart';
import 'package:fruits_app/core/utilis/validate.dart';
import 'package:fruits_app/features/checkout/presentation/manager/cubit/checkout_cubit.dart';

import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/widgets/text_form_filed.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.watch<CheckoutCubit>();
    return SingleChildScrollView(
      child: Form(
        key: cubit.formKey,
        autovalidateMode: cubit.autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: KVerticalPadding,),
          defaultTextForm(
            controller:cubit.nameController ,
          hint: AppString.name,
            type: TextInputType.name,
            validator: (String? value) {
           return validateName(value);
          },
          ),
            const SizedBox(height: 8,),
            defaultTextForm(
              controller:cubit.emailController ,
              type: TextInputType.emailAddress,
              hint: AppString.email,
              validator: (String? value) {
                return validateEmail(value);
              },

            ),
            const SizedBox(height: 8,),

            defaultTextForm(
              controller:cubit.phoneController ,
              hint: AppString.phone,
              type: TextInputType.phone,
              validator: (String? value) {
                return validatePhone(value);
              },
            ),
            const SizedBox(height: 8,),

            defaultTextForm(
              controller:cubit.addressController ,
              hint: AppString.address,
              type: TextInputType.streetAddress,
              validator: (String? value) {
               return validateAddress(value);
              },
            ),
            const SizedBox(height: 8,),

            defaultTextForm(
              controller:cubit.cityController ,
              hint: AppString.city,
              type: TextInputType.text,
              validator: (String? value) {
                return validateCity(value);
              },
            ),
            const SizedBox(height: 8,),
            defaultTextForm(
              controller:cubit.floorNumber ,
              hint: AppString.floorNumber,
              type: TextInputType.number,
              validator: (String? value) {
                return validateFloorNumber(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
