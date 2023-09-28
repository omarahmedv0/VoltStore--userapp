import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../view_data/cubit/cart_cubit.dart';

class CustomTextFieldCart extends StatelessWidget {
  const CustomTextFieldCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Expanded(
          child: TextFormField(
            enabled: state is CheckCouponSuccess ? false : true,
            controller: CartCubit.get(context).couponController,
            cursorColor: ColorsManager.primary,
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: state is CheckCouponSuccess
                      ? ColorsManager.grey
                      : ColorsManager.black,
                  fontSize: 15.sp,
                  height: 1,
                ),
            decoration: InputDecoration(
              hintText: '100'.tr,
              hintStyle: Theme.of(context).textTheme.labelMedium,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
