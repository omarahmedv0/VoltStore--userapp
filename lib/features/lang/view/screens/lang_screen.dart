import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors_manager.dart';
import '../../../onboarding/view_model/cubit/onboarding_cubit.dart';
import '../../view_model/cubit/language_cubit.dart';
import '../widgets/custom_textbottom_lang.dart';
import '../widgets/title_of_lang.dart';

class LangScreen extends StatelessWidget {
  const LangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        var cubit = LanguageCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleOFLang(),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextBottomLang(
                    fun: () {
                      OnboardingCubit.get(context)
                          .getOnboardingData()
                          .then((value) {
                        cubit.changeLange('ar');
                        cubit.goToOnboardingScreen(context);
                      });
                    },
                    text: '3'.tr,
                    color: ColorsManager.primary,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextBottomLang(
                    fun: () {
                      OnboardingCubit.get(context)
                          .getOnboardingData()
                          .then((value) {
                        cubit.changeLange('en');
                        cubit.goToOnboardingScreen(context);
                      });
                    },
                    text: '4'.tr,
                    color: ColorsManager.primary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
