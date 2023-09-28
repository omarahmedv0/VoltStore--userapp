import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

import '../constants/colors_manager.dart';
import 'language/initial_language.dart';

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer.playNotification();
    if (message.data['pagename'] == lange) {
      Get.snackbar(
        message.notification!.title!,
        message.notification!.body!,
        backgroundColor: ColorsManager.white.withOpacity(.4),
        colorText: ColorsManager.black,
        barBlur: 5,
      );
    }
  });
}
