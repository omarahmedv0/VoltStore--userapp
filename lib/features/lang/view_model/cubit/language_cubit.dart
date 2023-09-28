import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/constants/route_manager.dart';
import '../../../../core/functions/init_app.dart';
import '../../../../core/functions/language/initial_language.dart';
import '../../../../core/functions/navigation/to_named_and_remove_until.dart';
import '../../../../themes/theme_manager.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  static LanguageCubit get(context) {
    return BlocProvider.of(context);
  }

  ThemeManager themeManager = ThemeManager();

  changeLange(String langeCode) {
    Locale locale = Locale(langeCode);
    setLangeCode(langeCode);
    lange = langeCode;
    themeManager.changeTheme(langeCode);
    Get.updateLocale(locale);
  }

  void setLangeCode(String langeCode) {
    sharedPreferences.setString('lange', langeCode);
  }

  goToOnboardingScreen(context) {
    sharedPreferences.setBool('langOK', true);

    toNamedandRemoveUntil(context, RouteManager.onboarding);
  }
}
