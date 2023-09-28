// ignore_for_file: must_be_immutable
import 'package:e_commerce_app/core/shared/widgets/custom_appbar.dart';
import 'package:e_commerce_app/features/profile/presentation/view_data/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/profile_screen/custom_part_bottons_profile.dart';
import '../widgets/profile_screen/custom_part_user_data_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 10.h,
              ),
              CustomAppBar(
                ispadding: true,
                title: '102'.tr,
                isleading: false,
              ),
              SizedBox(
                height: 10.h,
              ),
              const CustomPartofUserdataProfile(),
              SizedBox(
                height: 20.h,
              ),
              const CustomPartBottonsProfile(),
            ],
          ),
        );
      },
    );
  }
}
