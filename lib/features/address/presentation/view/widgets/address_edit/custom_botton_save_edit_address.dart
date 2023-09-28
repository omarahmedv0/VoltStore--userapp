import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/functions/custom_snack_bar.dart';
import '../../../view_model/address_edit/edit_address_cubit.dart';

class CustomBottonSaveEditAddress extends StatelessWidget {
  const CustomBottonSaveEditAddress({
    super.key,
  });

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
                if (EditAddressCubit.get(context)
                    .formKey
                    .currentState!
                    .validate()) {
                  if (EditAddressCubit.get(context).citySelected != null) {
                    EditAddressCubit.get(context).editAddressData(context);
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
                '142'.tr,
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
