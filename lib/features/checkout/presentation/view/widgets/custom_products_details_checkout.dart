import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/check_product_color.dart';
import '../../../../../core/functions/check_product_size.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../../../cart/data/models/cart/cart_products.dart';

// ignore: must_be_immutable
class CustomProductDetailsPartCheckout extends StatelessWidget {
  CustomProductDetailsPartCheckout({super.key, required this.cartProductsData});
  CartProducts cartProductsData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  translateDataBase( cartProductsData.productNameAr!,  cartProductsData.productNameEn!)
                 ,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      overflow: TextOverflow.ellipsis,
                      height: 1.2),
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '129'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: ColorsManager.black.withOpacity(.6)),
                  ),
                  Text(
                    cartProductsData.countitems!,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          height: 1,
                          color: ColorsManager.black.withOpacity(.6),
                        ),
                  ),
                ],
              ),
            ],
          ),
           Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 5.w,
                ),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(
                    180,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    .7,
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: ColorsManager.black,
                    child: Text(
                      checkProductSize(cartProductsData.productSize!),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 10,
                            color: ColorsManager.white,
                          ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: checkProductColor(
                      cartProductsData.productColor!,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                '\$ ${cartProductsData.productNewprice}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorsManager.black,
                      fontWeight: FontWeight.w900,
                      height: 1.5,
                      fontSize: 14.sp,
                    ),
              ),
              SizedBox(
                width: 10.w,
              ),
              if (cartProductsData.productDescount  != '0')
                Text(
                  '\$ ${cartProductsData.productOldprice}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: ColorsManager.black.withOpacity(.6),
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
