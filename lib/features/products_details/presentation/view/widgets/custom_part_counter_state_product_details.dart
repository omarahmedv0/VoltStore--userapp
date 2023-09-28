import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/models/products.dart';
import 'custom_counter_product_details.dart';

class CustomPartCounterandStateProductDetails extends StatelessWidget {
  const CustomPartCounterandStateProductDetails({
    super.key,
    required this.productDetails,
  });

  final Products productDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (productDetails.productActive != '0' &&
            productDetails.productCount != '0')
          CustomCounterProductDetails(
            productData: productDetails,
          ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          productDetails.productActive == '0' ||
                  productDetails.productCount == '0'
              ? '147'.tr
              : '146'.tr,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontSize: 12.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
