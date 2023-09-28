import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/api_links.dart';
import '../../../../core/functions/translate_database.dart';
import '../../view_model/cubit/onboarding_cubit.dart';

class PageviewforOnboarding extends StatelessWidget {
  const PageviewforOnboarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        var controller = OnboardingCubit.get(context);
        return Expanded(
          flex: 4,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: (value) {
              controller.onPageChanged(value);
            },
            itemCount: controller.onboardingData!.data!.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      '${ApiLinks.onboardingImage}/${controller.onboardingData!.data![index].image!}',
                      fit: BoxFit.fill,
                      height: 400.h,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    translateDataBase(
                      controller.onboardingData!.data![index].titleAr!,
                      controller.onboardingData!.data![index].titleEn!,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(height: 1.2),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text(
                      translateDataBase(
                        controller.onboardingData!.data![index].bodyAr,
                        controller.onboardingData!.data![index].bodyEn,
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            height: 1.2,
                          ),
                    ),
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
