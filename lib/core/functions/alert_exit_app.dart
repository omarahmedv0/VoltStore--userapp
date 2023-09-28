import 'dart:io';

import 'package:dialogs/dialogs/choice_dialog.dart';
import 'package:get/get.dart';

import '../constants/colors_manager.dart';

Future<bool> alertExitApp(context) {
  ChoiceDialog(
    title: '69'.tr,
    message: '70'.tr,
    buttonCancelText: '72'.tr,
    buttonCancelOnPressed: () {
      Get.back();
    },
    buttonCancelBorderColor: ColorsManager.primary,
    buttonOkText: '71'.tr,
    buttonOkColor: ColorsManager.primary,
    buttonOkOnPressed: () {
      exit(0);
    },
  ).show(context);

  return Future.value(false);
}
