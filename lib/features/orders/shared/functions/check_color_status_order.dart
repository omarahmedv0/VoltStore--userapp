import 'dart:ui';

import '../../../../core/constants/colors_manager.dart';

Color changeColorStatusOrder(String val) {
  switch (val) {
    case '0':
      return ColorsManager.orange;
    case '1':
      return ColorsManager.blue;
    case '2':
      return ColorsManager.amber;
    case '3':
      return ColorsManager.blue;
    case '4':
      return ColorsManager.green;
    default:
      return ColorsManager.red;
  }
}
