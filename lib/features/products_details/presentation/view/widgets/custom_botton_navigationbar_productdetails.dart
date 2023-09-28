import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/assets/icon_assets_manager.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/models/products.dart';
import '../../../../cart/presentation/view_data/cubit/cart_cubit.dart';
import '../../view_model/cubit/product_details_cubit.dart';

// ignore: must_be_immutable
class CustomBottonNavigationbarProductDetails extends StatelessWidget {
  CustomBottonNavigationbarProductDetails({
    super.key,
    required this.productDetails,
  });

  Products productDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14, left: 14, top: 10, bottom: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '157'.tr,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 12,
                    ),
              ),
              Text(
                '\$${productDetails.productNewPrice!}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: 1.2,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: ColorsManager.black),
              )
            ],
          ),
          SizedBox(
            width: 5.w,
          ),
          if (productDetails.productDiscount != '0')
            Text(
              '\$${productDetails.productOldPrice}',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: ColorsManager.black.withOpacity(.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp),
            ),
          const Spacer(),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              color: productDetails.productActive == '0'
                  ? ColorsManager.grey
                  : ColorsManager.primary,
              borderRadius: BorderRadiusDirectional.circular(180),
            ),
            child: TextButton(
              onPressed: () {
                if (productDetails.productActive == '0' ||
                    productDetails.productCount == '0') {
                  customSnackBar(
                    context,
                    '154'.tr,
                    AnimatedSnackBarType.info,
                    30,
                  );
                } else {
                  if (ProductDetailsCubit.get(context).colorSelectedName ==
                      null) {
                    customSnackBar(
                      context,
                      '155'.tr,
                      AnimatedSnackBarType.info,
                      30,
                    );
                  } else if (ProductDetailsCubit.get(context)
                          .sizeSelectedName ==
                      null) {
                    customSnackBar(
                      context,
                      '156'.tr,
                      AnimatedSnackBarType.info,
                      30,
                    );
                  } else {
                    CartCubit.get(context)
                        .addCart(
                      productDetails.productId!,
                      ProductDetailsCubit.get(context).colorSelectedName!,
                      ProductDetailsCubit.get(context).sizeSelectedName!,
                      context,
                    )
                        .then((value) {
                      customSnackBar(
                        context,
                        '153'.tr,
                        AnimatedSnackBarType.info,
                        30,
                      );
                      ProductDetailsCubit.get(context).toCartScreen(context);
                    });
                  }
                }
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 18.w,
                  ),
                  Image.asset(
                    IconsAssetsManager.cartBag,
                    color: ColorsManager.white,
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '150'.tr,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: ColorsManager.white,
                          fontSize: 15.sp,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
