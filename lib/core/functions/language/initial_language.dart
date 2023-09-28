import 'package:flutter/material.dart';

import '../init_app.dart';
import 'check_language.dart';

String? lange;
Locale? language;

void initialLanguage() {
  lange = sharedPreferences.getString('lange');
  language = checkLanguage(lange, language);
}
