
import 'package:flutter/material.dart';

import '../../../../core/constants/colors_manager.dart';

// ignore: must_be_immutable
class CustomIconBottom extends StatelessWidget {
   CustomIconBottom({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.selected
  });
    bool selected ;

  String icon;
   Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon:Image.asset(icon,color: selected == true ?ColorsManager.primary:ColorsManager.grey),
    );
  }
}
