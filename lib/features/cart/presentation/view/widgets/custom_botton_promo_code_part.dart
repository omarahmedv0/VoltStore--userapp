import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../view_data/cubit/cart_cubit.dart';

class CustomBottonPromoCodePart extends StatelessWidget {
  const CustomBottonPromoCodePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: state is CheckCouponSuccess
                ? ColorsManager.black
                : ColorsManager.primary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {
              if (state is CheckCouponSuccess) {
                CartCubit.get(context).removeCoupon();
              } else {
                CartCubit.get(context).checkCoupon(context);
              }
            },
            child: Text(
              state is CheckCouponSuccess ? '99'.tr : '98'.tr,
              style: const TextStyle(
                fontSize: 15,
                color: ColorsManager.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
