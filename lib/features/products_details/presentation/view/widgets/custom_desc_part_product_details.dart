import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../../../../core/models/products.dart';

class CustomDescPartProductDetails extends StatelessWidget {
  const CustomDescPartProductDetails({
    super.key,
    required this.productDetails,
  });

  final Products productDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '149'.tr,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          translateDataBase(
              productDetails.productDescAr!, productDetails.productDescEn!),
          maxLines: 100,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: ColorsManager.black.withOpacity(.7),
              fontWeight: FontWeight.normal,
              fontSize: 12.sp),
        ),
      ],
    );
  }
}
