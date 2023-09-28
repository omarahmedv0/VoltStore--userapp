import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors_manager.dart';
import '../../view_model/cubit/onboarding_cubit.dart';
import '../widgets/controller_of_onboarding.dart';
import '../widgets/pageview_for_onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: ColorsManager.white,
              body: Column(
                children: [
                  const PageviewforOnboarding(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        const ControllerOFonboarding(),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            OnboardingCubit.get(context).next(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorsManager.primary,
                                borderRadius: BorderRadius.circular(180)),
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: ColorsManager.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
