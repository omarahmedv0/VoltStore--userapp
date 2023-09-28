// ignore_for_file: use_build_context_synchronously
import 'package:e_commerce_app/features/auth/data/repos/login_repo/login_repo_impl.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/route_manager.dart';
import '../../../../core/functions/init_app.dart';
import '../../../../core/functions/navigation/to_named_and_remove_until.dart';
import '../../data/model/user_model/user_model.dart';
import '../shared/functions/check_failere_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepoImpl) : super(LoginInitial());
  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }
UserModel? userData;
  final LoginRepoImpl _loginRepoImpl;
  TextEditingController emailControllerLogin = TextEditingController();
  TextEditingController passwordControllerLogin = TextEditingController();
  GlobalKey<FormState> formKeyForLogin = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    emit(LoginLoading());
    var response = await _loginRepoImpl.login(
      passwordControllerLogin.text,
      emailControllerLogin.text,
    );
    response.fold((failure) {
      checkFailereAuth(context, failure);
      emit(LoginFailure(failure.errMessage));
    }, (userModel) {
      userData = userModel;
      setUserData(userModel);
      FirebaseMessaging.instance.subscribeToTopic('users');
      FirebaseMessaging.instance
          .subscribeToTopic('user${sharedPreferences.getString('userID')}');
      toNamedandRemoveUntil(context, RouteManager.layout);
      sharedPreferences.setBool('authOK', true);

      emit(LoginSuccess());
    });
  }

  void setUserData(UserModel userModel) {
    sharedPreferences.setString('userID', userModel.data!.userId!);
    sharedPreferences.setString('username', userModel.data!.userName!);
    sharedPreferences.setString('email', userModel.data!.userEmail!);
        sharedPreferences.setString('phone', userModel.data!.userPhone!);

    sharedPreferences.setString('password', userModel.data!.userPassword!);
    sharedPreferences.setString('image', userModel.data!.userImage!);

  }

  goToSignUpScreen(BuildContext context) {
    toNamedandRemoveUntil(context, RouteManager.signup);
  }



  bool obscureText = true;

  showandHidePassword() {
     if (obscureText == false) {
    obscureText = true;
  } else {
    obscureText = false;
  }
    emit(ChangeObscureTextStateLogin());
  }

  @override
  Future<void> close() async {
    emailControllerLogin.dispose();
    passwordControllerLogin.dispose();
    super.close();
  }
}
