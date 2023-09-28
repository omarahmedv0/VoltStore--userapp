
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/colors_manager.dart';

// ignore: must_be_immutable
class CustomEditProfileBotton extends StatelessWidget {
   CustomEditProfileBotton({
    super.key,
    required this.onTap,
    required this.text
  });
 Function()? onTap;
 String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.primary,
        borderRadius: BorderRadius.circular(
          180,
        ),
      ),
      width: double.infinity,
      height: 40.h,
      child: TextButton(
          onPressed:onTap,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorsManager.white),
          )),
    );
  }
}
