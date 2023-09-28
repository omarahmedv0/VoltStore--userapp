
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';

class CustomAppbarSearch extends StatelessWidget {
  const CustomAppbarSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            pop(context);
          },
          child:const Icon(
            Icons.arrow_back_ios,
            color: ColorsManager.primary,
          ),
        ),
      ],
    );
  }
}
