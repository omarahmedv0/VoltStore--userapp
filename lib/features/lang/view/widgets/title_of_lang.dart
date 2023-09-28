import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TitleOFLang extends StatelessWidget {
  const TitleOFLang({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(

          '1'.tr,
          style:Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          textAlign: TextAlign.center,
          '2'.tr,
          maxLines: 3,
          style:Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18.sp),
        ),
      ],
    );
  }
}
