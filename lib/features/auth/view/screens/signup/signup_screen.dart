import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/alert_exit_app.dart';
import '../../../../../core/functions/valid_input/valid_input_fun.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../view_model/signup_cubit/signup_cubit.dart';
import '../../widgets/custom_text_body_auth.dart';
import '../../widgets/custom_text_signup_or_login.dart';
import '../../widgets/custom_textbottom_auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        var cubit = SignupCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorsManager.white,
            body: WillPopScope(
              onWillPop: () => alertExitApp(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: cubit.formKeyForSignup,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          CustomAppBar(
                            ispadding: false,
                            title: '24'.tr,
                            isleading: false,
                          ),
                          CustomTextBodyAuth(
                            body: '26'.tr,
                            title: '25'.tr,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomTextFormField
                          (
                              controller: cubit.nameControllerSignup,
                            keyboardType: TextInputType.text,
                            hint: '29'.tr,
                            labelText: '27'.tr,
                            suffIcon: const Icon(
                              Icons.person_outlined,
                              color: ColorsManager.grey,
                            ),
                            validator: (s) {
                              return validInputFun(s!, 5, 30, 'username');
                            },
                          ),
                         
                          const SizedBox(
                            height: 25,
                          ),
                            CustomTextFormField
                          (
                              controller: cubit.emailControllerSignup,
                            keyboardType: TextInputType.emailAddress,
                            hint: '9'.tr,
                            labelText: '8'.tr,
                            suffIcon: const Icon(
                              Icons.email_outlined,
                              color: ColorsManager.grey,
                            ),
                            validator: (s) {
                              return validInputFun(s!, 10, 100, 'email');
                            },
                          ),
                         
                          const SizedBox(
                            height: 25,
                          ),
                            CustomTextFormField
                          (
                             controller: cubit.phoneControllerSignup,
                            keyboardType: TextInputType.number,
                            hint: '30'.tr,
                            labelText: '28'.tr,
                            suffIcon: const Icon(
                              Icons.phone_android_outlined,
                              color: ColorsManager.grey,
                            ),
                            validator: (s) {
                              return validInputFun(s!, 11, 11, 'phone');
                            },
                          ),
                         
                          const SizedBox(
                            height: 25,
                          ),
                            CustomTextFormField
                          (
                            obscureText: cubit.obscureText,
                            onTapIcon: () {
                              cubit.showandHidePassword();
                            },
                            controller: cubit.passwordControllerSignup,
                            keyboardType: TextInputType.visiblePassword,
                            hint: '11'.tr,
                            labelText: '10'.tr,
                            suffIcon: cubit.obscureText == false
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: ColorsManager.primary,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: ColorsManager.grey,
                                  ),
                            validator: (s) {
                              return validInputFun(s!, 8, 30, 'password');
                            },
                          ),
                        
                          SizedBox(
                            height: 30.sp,
                          ),
                          CustomTextBottomAuth(
                            fun: () async {
                              if (cubit.formKeyForSignup.currentState!
                                  .validate()) {
                                await cubit.signup(context);
                              }
                            },
                            text: '24'.tr,
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          CustomTextSignupORlogin(
                            text1: '31'.tr,
                            text2: '5'.tr,
                            fun: () {
                              cubit.goToLoginScreen(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
