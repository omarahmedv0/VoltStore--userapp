  import 'package:get/get.dart';

String checkStateOrder(String val) {
    switch (val) {
      case '0':
        return '118'.tr;
      case '1':
        return '119'.tr;
        case '2':
        return '120'.tr;
      case '3':
        return '121'.tr;
      case '4':
        return '122'.tr;
      default:
        return '123'.tr;
    }
  }