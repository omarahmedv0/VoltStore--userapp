import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../constants/assets/image_assets_manager.dart';
import '../constants/colors_manager.dart';

Widget customRatingDialog(Function(RatingDialogResponse) onSubmitted, context) {
  return RatingDialog(
    submitButtonTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: ColorsManager.primary,
    ),
    initialRating: 1.0,
    title: Text(
      'VOLT Store',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
    ),
    message: Text(
      maxLines: 5,
      '143'.tr,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.2),
    ),
    starSize:20 ,
    image: Image.asset(
      ImageAssetsManager.logo,
      width: 100,
      height: 100,
    ),
    submitButtonText: '144'.tr,
    commentHint: '145'.tr,
    onCancelled: () => print('cancelled'),
    onSubmitted: onSubmitted,
  );
}
