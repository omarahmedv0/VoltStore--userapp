import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../../../../core/models/products.dart';
import '../../../../rating/presentation/view_data/products_reviews_cubit/products_reviews_cubit.dart';
import '../../view_model/cubit/product_details_cubit.dart';

class CustomPartTitleReviewProductDetails extends StatelessWidget {
  const CustomPartTitleReviewProductDetails({
    super.key,
    required this.productDetails,
  });

  final Products productDetails;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translateDataBase(
                productDetails.productNameAr!, productDetails.productNameEn!),
            maxLines: 3,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 17.sp,
                ),
          ),
          Row(
            children: [
              ...List.generate(
                ProductsReviewsCubit.get(context)
                    .productsReviewsData
                    .avrgStars!.toInt(),
                (index) => const Icon(
                  Icons.star,
                  size: 15,
                  color: ColorsManager.amber,
                ),
              ),
              Text(
                '(${ProductsReviewsCubit.get(context).productsReviewsData.countReviews} ${'151'.tr})',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 12,
                    ),
              ),
            ],
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
              (states) => ColorsManager.primary,
            )),
            onPressed: () {
              ProductDetailsCubit.get(context).toSeeAllReviews(
                context,
                productDetails,
              );
            },
            child: Text(
              '152'.tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorsManager.white,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
