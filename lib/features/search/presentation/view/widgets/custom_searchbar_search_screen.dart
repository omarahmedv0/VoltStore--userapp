
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_search_botton_search_screen.dart';
import 'custom_text_field_search.dart';

class CustomSearchbarSearchScreen extends StatelessWidget {
  const CustomSearchbarSearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       const Expanded(
          child:  CustomTextFormFieldSearch(),
        ),
        SizedBox(
          width: 10.w,
        ),
        const CustomSearchBottonSearchScreen(),
      ],
    );
  }
}
