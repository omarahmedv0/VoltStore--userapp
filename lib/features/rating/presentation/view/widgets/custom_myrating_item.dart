import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../../data/models/myrating_model/myrating_data.dart';
import '../../view_data/rating_cubit/rating_cubit.dart';

// ignore: must_be_immutable
class CustomMyratingItem extends StatelessWidget {
  CustomMyratingItem({super.key, required this.myratingData});

  MyratingData myratingData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.w),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorsManager.grey.withOpacity(.2)),
                child: Image.network(
                  '${ApiLinks.productsImagesLink}/${myratingData.productImage}',
                  width: 70.w,
                  height: 70.h,
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
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: Text(
                          translateDataBase( myratingData.productNameAr,  myratingData.productNameEn)
                         ,
                          maxLines: 2,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                    height: 1.2,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$ ${myratingData.productOldprice}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorsManager.black,
                              fontWeight: FontWeight.w900,
                              height: 1.5,
                              fontSize: 18.sp,
                            ),
                      ),
                      SizedBox(
                        width: 70.w,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0.w),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ...List.generate(
                            int.parse(myratingData.rateStar!),
                            (index) => const Icon(
                              Icons.star_rounded,
                              color: ColorsManager.amber,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 265.w,
                            child: Text(
                              myratingData.rateComment!,
                              maxLines: 20,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    color: ColorsManager.black.withOpacity(.6),
                                    fontSize: 18.sp,
                                    height: 1.2,
                                  ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              RatingCubit.get(context).showRatingDialog(
                                context,
                                myratingData.productId!,
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
                      Text(
                        myratingData.rateDate!,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
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
