import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/class/api/failures.dart';
import '../../../../../core/functions/custom_dialog.dart';

class AuthFailereHandling {
  void emailorPhoneExistCase(context) {
    customDialog(context, '73'.tr, '74'.tr, '72'.tr, () {
      Get.back();
    });
  }

  void otherFailereCase(BuildContext context, Failure failure) {
    customDialog(context, '78'.tr, failure.errMessage, '72'.tr, () {
      Get.back();
    });
  }

  void offlineFailureCase(BuildContext context) {
    customDialog(context, '78'.tr, '76'.tr, '72'.tr, () {
      Get.back();
    });
  }

  void incorrectEmailorPasswordCase(context) {
    customDialog(context, '73'.tr, '75'.tr, '72'.tr, () {
      Get.back();
    });
  }
}
