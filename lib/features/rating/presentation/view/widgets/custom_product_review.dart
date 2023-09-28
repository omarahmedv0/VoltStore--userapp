import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../../../../core/models/products.dart';

// ignore: must_be_immutable
class CustomProductReview extends StatelessWidget {
   CustomProductReview({
super.key,
    required this.avrgRate,
    required this.countReviews,
    required this.product
  });
  Products product;
  String avrgRate;
    String countReviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorsManager.grey.withOpacity(.2)),
          child: Image.network(
          '${ApiLinks.productsImagesLink}/${product.productImage}',
            width: 80.w,
            height: 80.h,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.4,
                  child: Text(
                    translateDataBase( product.productNameAr!,  product.productNameEn!)
                   ,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                          height: 1.2,
                        ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: ColorsManager.amber,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  avrgRate,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorsManager.black,
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        fontSize: 25.sp,
                      ),
                ),
              ],
            ),
            SizedBox(
              width: 70.w,
            ),
            Text(
              '$countReviews ${'151'.tr}',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorsManager.black,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    fontSize: 20.sp,
                  ),
            ),
            SizedBox(
              width: 70.w,
            ),
          ],
        ),
      ],
    );
  }
}
