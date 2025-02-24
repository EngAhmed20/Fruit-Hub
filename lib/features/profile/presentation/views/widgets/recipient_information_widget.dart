import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/data/model/order_model.dart';

import '../../../../../core/utilis/app_string.dart';
import '../../../../../core/utilis/app_style/app_text_styles.dart';
import '../../../../checkout/domain/entities/shipping_address_entity.dart';


class RecipientInformationWidget extends StatelessWidget {
  const RecipientInformationWidget({
    super.key,
    required this.shippingAddressEntity,
  });

  final ShippingAddressEntity shippingAddressEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppString.recipientInformation,
            style: textStyle.Bold19,
          ),
          const SizedBox(height: 6,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                const Text(
                  AppString.shippingAddress,
                  style: textStyle.Bold16,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(child: Text('${shippingAddressEntity.shippingAddressDetails()}',style: textStyle.semiBold16,)),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
