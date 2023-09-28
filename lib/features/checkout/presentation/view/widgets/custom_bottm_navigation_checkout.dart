// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/shared/widgets/custom_botton.dart';
import '../../view_model/checkout_cubit/checkout_cubit.dart';

class CustomBottomNavigationCheckout extends StatelessWidget {
  const CustomBottomNavigationCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10.h,
        right: 20.w,
        left: 20.w,
      ),
      child: CustomBotton(
        onPressed: () async {
          await CheckoutCubit.get(context).placeanOrder(context);
        },
        text: '163'.tr,
      ),
    );
  }
}
