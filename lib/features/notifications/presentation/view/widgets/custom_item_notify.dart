// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/core/constants/api_links.dart';
import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/notifications_data.dart';

class CustomItemNotify extends StatelessWidget {
  CustomItemNotify({super.key, required this.notificationsModel});
  NotificationsData notificationsModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          '${ApiLinks.notificationsImagesLink}/${notificationsModel.notificationsImage!}',
          width: 50.w,
          height: 50.h,
        ),
        SizedBox(
          width: 5.w,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                translateDataBase(notificationsModel.notificationsTitleAr,
                    notificationsModel.notificationsTitleEn),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(height: 1.2),
              ),
              Text(
                 translateDataBase(notificationsModel.notificationsBodyAr,
                    notificationsModel.notificationsBodyEn),
                maxLines: 100,

                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.2,
                    ),
              ),
              Text(
               notificationsModel.notificationsDatetime!
                ,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 1.2,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
