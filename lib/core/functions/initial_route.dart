import '../constants/route_manager.dart';
import 'init_app.dart';

String initialRoute() {
  bool? onboarding = sharedPreferences.getBool('onboarding');
  bool? auth = sharedPreferences.getBool('authOK');
  bool? chooseLang = sharedPreferences.getBool('langOK');

  
 if (auth == true) {
    return RouteManager.layout;
  } else if (onboarding == true) {
    return RouteManager.login;
  } else if (chooseLang == true) {
    return RouteManager.onboarding;
  } else {
    return RouteManager.lang;
  }  
}
