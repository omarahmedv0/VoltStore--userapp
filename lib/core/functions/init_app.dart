// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/functions/fcm_config.dart';
import 'package:e_commerce_app/core/functions/permissions/request_permission_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../class/observer.dart';
import '../constants/api_links.dart';
import 'language/initial_language.dart';

late SharedPreferences sharedPreferences;
initApp() async {
  sharedPreferences = await SharedPreferences.getInstance();
  initialLanguage();
  Firebase.initializeApp().then((value) {
    requestPermissionFcm();
  });

  fcmConfig();
  Bloc.observer = MyBlocObserver();
  Stripe.publishableKey = ApiLinks.publishableKeyStripe;
}
