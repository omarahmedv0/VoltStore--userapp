// ignore_for_file: must_be_immutable

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/features/cart/data/models/cart/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/shared/widgets/custom_botton.dart';
import '../../view_data/cubit/cart_cubit.dart';
import 'custom_price_part_cart.dart';
import 'custom_promo_code_cart.dart';

class CustomBottomNavigationCart extends StatelessWidget {
  CustomBottomNavigationCart({super.key, required this.totalData});
  CartData totalData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorsManager.white),
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CustomPromoCodeCart(),
            SizedBox(
              height: 10.h,
            ),
            CustomPricePartCart(totalData: totalData),
            CustomBotton(
              onPressed: () {
                if (CartCubit.get(context)
                    .cartModel
                    .data
                    .cartProducts
                    .isEmpty) {
                  customSnackBar(
                    context,
                    "101".tr,
                    AnimatedSnackBarType.info,
                    30,
                  );
                } else {
                  CartCubit.get(context).toCheckoutScreen(
                    context,
                    totalData.subCartprice,
                    CartCubit.get(context).discountCalculation().toString(),
                    totalData.countitems,

                  );
                }
              },
              text: '97'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
