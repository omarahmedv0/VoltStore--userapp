import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/functions/language/initial_language.dart';
import '../../../../../lang/view_model/cubit/language_cubit.dart';
import '../../../view_data/cubit/profile_cubit.dart';
import '../edit_profile/custom_edit_profile_botton.dart';
import 'custom_card.dart';

class CustomPartBottonsProfile extends StatelessWidget {
  const CustomPartBottonsProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomEditProfileBotton(
            onTap: () {
              ProfileCubit.get(context).toEditProfile(context);
              
            },
            text: '103'.tr,
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                
                onTap: () {
                  LanguageCubit.get(context).changeLange('ar');
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Row(
                    children: [
                      lange == 'ar'
                          ? const Icon(
                              Icons.circle,
                              color: ColorsManager.primary,
                            )
                          : Icon(
                              Icons.circle_outlined,
                              color: ColorsManager.black.withOpacity(.6),
                            ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '173'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: ColorsManager.black,
                                      fontSize: 18.sp,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  LanguageCubit.get(context).changeLange('en');

                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width /  2,
                  child: Row(
                    children: [
                      lange == 'en'
                          ? const Icon(
                              Icons.circle,
                              color: ColorsManager.primary,
                            )
                          : Icon(
                              Icons.circle_outlined,
                              color: ColorsManager.black.withOpacity(.6),
                            ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '174'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: ColorsManager.black,
                                      fontSize: 18.sp,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          CustomCard(
            text: '104'.tr,
            fun: () {
              ProfileCubit.get(context).toMyorders(context);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomCard(
            text: '105'.tr,
            fun: () {
              ProfileCubit.get(context).toOrdersReceived(context);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomCard(
            text: '106'.tr,
            fun: () {
              ProfileCubit.get(context).toAddressScreen(context);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomCard(
            text: '107'.tr,
            fun: () {
              ProfileCubit.get(context).toMyrating(context);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomCard(
            text: '108'.tr,
            icon: const Icon(
              Icons.phone,
              color: ColorsManager.grey,
            ),
            fun: () {
              launchUrl(
                Uri.parse('tel:+2001275318664'),
              );
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomCard(
            text: '109'.tr,
            icon: const Icon(
              Icons.exit_to_app_outlined,
              color: ColorsManager.red,
            ),
            fun: () {
              ProfileCubit.get(context).logout(context);
            },
          ),
        ],
      ),
    );
  }
}
