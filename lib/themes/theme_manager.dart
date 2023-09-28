// ignore_for_file: unused_local_variable
import 'package:e_commerce_app/themes/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/colors_manager.dart';

class ThemeManager {
  void changeTheme(String langeCode) {
    ThemeData? appTheme;
    appTheme = langeCode == 'ar'
        ? ThemeManager.arabicTheme
        : ThemeManager.englishTheme;
    Get.changeTheme(appTheme);
  }

  static ThemeData englishTheme = ThemeData(
    fontFamily: 'Cairo',
     floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.primary,
    ),
    textTheme: textManager(),
  );

  static ThemeData arabicTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.primary,
    ),
    fontFamily: 'Cairo',
    textTheme: textManager(),
  );
}
