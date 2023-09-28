// ignore_for_file: must_be_immutable
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/features/address/presentation/view_model/add_address/add_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/functions/custom_snack_bar.dart';

class CustomBottonSaveAddress extends StatelessWidget {
  CustomBottonSaveAddress({super.key, required this.lat, required this.long});
  String lat;
  String long;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorsManager.primary,
            ),
            child: TextButton(
              onPressed: () {
                if (AddAddressCubit.get(context)
                    .formKey
                    .currentState!
                    .validate()) {
                  if (AddAddressCubit.get(context).citySelected != null) {
                    AddAddressCubit.get(context).addAddress(context, lat, long);
                  } else {
                    customSnackBar(
                      context,
                      '161'.tr,
                      AnimatedSnackBarType.info,
                      30,
                    );
                  }
                }
              },
              child: Text(
                '162'.tr,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: ColorsManager.white,
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
