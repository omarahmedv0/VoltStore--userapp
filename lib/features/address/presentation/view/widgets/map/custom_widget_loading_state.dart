
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/constants/assets/lottie_assets_manager.dart';

class CustomWidgetLoadingState extends StatelessWidget {
  const CustomWidgetLoadingState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Lottie.asset(
            LottieAssetsManager.loading,
            width: 300,
            height: 450,
          ),
        ),
      ],
    );
  }
}
