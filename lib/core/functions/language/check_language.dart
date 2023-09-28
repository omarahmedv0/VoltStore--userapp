import 'package:flutter/material.dart';
 Locale checkLanguage(String? lange, Locale? language) {
    if (lange == 'ar') {
      language = const Locale('ar');
    } else if (lange == 'en') {
      language = const Locale('en');
    } else {
      language = const Locale('en');
    }
    return language;
  }
