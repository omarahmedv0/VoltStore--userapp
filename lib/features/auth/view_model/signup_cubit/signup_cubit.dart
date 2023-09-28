import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/route_manager.dart';
import '../../../../core/functions/init_app.dart';
import '../../../../core/functions/navigation/to_named_and_remove_until.dart';
import '../../data/model/user_model/user_model.dart';
import '../../data/repos/signup_repo/signup_repo_impl.dart';
import '../shared/functions/check_failere_auth.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signupRepoImpl) : super(SignupInitial());
  static SignupCubit get(context) {
    return BlocProvider.of(context);
  }

  UserModel? userData;
  final SignupRepoImpl _signupRepoImpl;
  TextEditingController emailControllerSignup = TextEditingController();
  TextEditingController passwordControllerSignup = TextEditingController();
  TextEditingController phoneControllerSignup = TextEditingController();
  TextEditingController nameControllerSignup = TextEditingController();
  GlobalKey<FormState> formKeyForSignup = GlobalKey<FormState>();

  Future<void> signup(context) async {
    emit(SignupLoading());
    var response = await _signupRepoImpl.signup(
      passwordControllerSignup.text,
      emailControllerSignup.text,
      phoneControllerSignup.text,
      nameControllerSignup.text,
    );
    response.fold((failure) {
      checkFailereAuth(context, failure);
      emit(SignupFailure(failure.errMessage));
    }, (userModel) {
      setUserData(userModel);
      FirebaseMessaging.instance.subscribeToTopic('users');
      FirebaseMessaging.instance
          .subscribeToTopic('user${sharedPreferences.getString('userID')}');
      toNamedandRemoveUntil(context, RouteManager.layout);
      sharedPreferences.setBool('authOK', true);
      emit(SignupSuccess());
    });
  }

  void setUserData(UserModel userModel) {
    sharedPreferences.setString('userID', userModel.data!.userId!);
    sharedPreferences.setString('username', userModel.data!.userName!);
        sharedPreferences.setString('phone', userModel.data!.userPhone!);

    sharedPreferences.setString('email', userModel.data!.userEmail!);
    sharedPreferences.setString('password', userModel.data!.userPassword!);
    sharedPreferences.setString('image', userModel.data!.userImage!);
  }

  bool obscureText = true;

  showandHidePassword() {
    if (obscureText == false) {
      obscureText = true;
    } else {
      obscureText = false;
    }
    emit(ChangeObscureTextStateSignup());
  }

  goToLoginScreen(BuildContext context) {
    toNamedandRemoveUntil(context, RouteManager.login);
  }

  @override
  Future<void> close() async {
    emailControllerSignup.dispose();
    passwordControllerSignup.dispose();
    nameControllerSignup.dispose();
    phoneControllerSignup.dispose();
    super.close();
  }
}
