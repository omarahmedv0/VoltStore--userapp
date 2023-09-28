import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/init_app.dart';
import '../../../data/models/products_reviews/products_reviews_data.dart';
import '../../view_data/rating_cubit/rating_cubit.dart';

// ignore: must_be_immutable
class CustomReviewItem extends StatelessWidget {
  CustomReviewItem(
      {super.key, required this.productsReviewsData, required this.productID});
  ProductsReviewsData productsReviewsData;
  String productID;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(10.0.w),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productsReviewsData.userName!,
                            maxLines: 20,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  color: ColorsManager.black.withOpacity(.6),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  height: 1.2,
                                ),
                          ),
                          if(productsReviewsData.userId == sharedPreferences.getString('userID'))
                          InkWell(
                            onTap: () {
                              RatingCubit.get(context).showRatingDialog(
                                context,
                                productID,
                                isAdd: false,
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: ColorsManager.primary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        ...List.generate(
                          int.parse(productsReviewsData.rateStar!),
                          (index) => const Icon(
                            Icons.star_rounded,
                            color: ColorsManager.amber,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 265.w,
                      child: Text(
                        productsReviewsData.rateComment!,
                        maxLines: 20,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              overflow: TextOverflow.ellipsis,
                              color: ColorsManager.black.withOpacity(.6),
                              fontSize: 18.sp,
                              height: 1.2,
                            ),
                      ),
                    ),
                    Text(
                      productsReviewsData.rateDate!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
         Positioned(
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              '${ApiLinks.profileImagesLink}/${productsReviewsData.userImage}',
            ),
          ),
        ),
      ],
    );
  }
}
