// ignore_for_file: must_be_immutable
import 'package:e_commerce_app/features/cart/data/models/cart/cart_data.dart';
import 'package:e_commerce_app/features/cart/presentation/view_data/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';

class CustomPricePartCart extends StatelessWidget {
  CustomPricePartCart({super.key, required this.totalData});
  CartData totalData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '92'.tr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
            ),
           const Spacer(),
            Text(
              '\$ ${totalData.subCartprice}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: ColorsManager.black,
                    height: 1.5,
                  ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '93'.tr,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
            ),
           const Spacer(),
            Text(
              '\$ ${CartCubit.get(context).discountCalculation()}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: ColorsManager.black,
                    height: 1.5,
                  ),
            ),
          ],
        ),
       
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: .5,
          width: double.infinity,
          color: ColorsManager.grey,
        ),
        Row(
          children: [
            Text(
              '${'95'.tr} (${totalData.countitems} ${'96'.tr}) :',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.primary,
                  ),
            ),
            const Spacer(),
            Text(
              '\$ ${CartCubit.get(context).sumTotalCart()}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: ColorsManager.black,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
