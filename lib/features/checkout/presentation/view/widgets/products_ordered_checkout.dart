import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../view_model/checkout_cubit/checkout_cubit.dart';
import 'custom_products_ordered_checkout.dart';

class ProductsOrderedCheckout extends StatelessWidget {
  const ProductsOrderedCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '165'.tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: ColorsManager.black, fontSize: 20.sp),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: CheckoutCubit.get(context)
                .cartProducts
                .data
                .cartProducts
                .length,
            itemBuilder: (BuildContext context, int index) {
              return CustomProductOrderedCheckout(
                cartProductsData: CheckoutCubit.get(context)
                    .cartProducts
                    .data
                    .cartProducts[index],
              );
            },
          )
        ],
      ),
    );
  }
}
