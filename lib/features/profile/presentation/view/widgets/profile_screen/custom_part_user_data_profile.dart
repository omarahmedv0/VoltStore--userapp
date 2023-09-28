
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/api_links.dart';
import '../../../../../../core/functions/init_app.dart';

class CustomPartofUserdataProfile extends StatelessWidget {
  const CustomPartofUserdataProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       CircleAvatar(
         radius: 35,
         backgroundImage: NetworkImage("${ApiLinks.profileImagesLink}/${sharedPreferences.getString('image')!}"),
       ),
       SizedBox(
         width: 10.w,
       ),
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(
             sharedPreferences.getString('username')!,
           style: Theme.of(context).textTheme.titleSmall,
           ),
            Text(
             sharedPreferences.getString('email')!,
           style: Theme.of(context).textTheme.labelMedium?.copyWith(
             height: 1
           ),
           ),
         ],
       ),
     ],
          );
  }
}
