import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors_manager.dart';
import '../../view_model/cubit/onboarding_cubit.dart';

class ControllerOFonboarding extends StatelessWidget {
  const ControllerOFonboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        var controller = OnboardingCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
                controller.onboardingData!.data!.length,
                (index) => AnimatedContainer(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      duration: const Duration(
                        milliseconds: 600,
                      ),
                      height: 7,
                      width: controller.currentPage == index ? 25 : 7,
                      decoration: BoxDecoration(
                        color: controller.currentPage == index
                            ? ColorsManager.primary
                            : ColorsManager.primary.withOpacity(.6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
          ],
        );
      },
    );
  }
}
