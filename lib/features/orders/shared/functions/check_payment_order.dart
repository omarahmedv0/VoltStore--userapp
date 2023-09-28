  import 'package:get/get.dart';

String checkPaymentOrder(String val) {
    switch (val) {
      case 'cash':
        return '124'.tr;
      default:
        return '125'.tr;
    }
  }