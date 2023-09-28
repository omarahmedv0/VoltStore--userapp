import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/functions/valid_input/valid_input_fun.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../view_data/cubit/profile_cubit.dart';
import '../widgets/edit_profile/custom_edit_image_profile_screen.dart';
import '../widgets/edit_profile/custom_edit_profile_botton.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return SafeArea(
            child: Scaffold(
          body: Form(
            key: cubit.formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CustomAppBar(
                  ispadding: true,
                  isleading: true,
                  onTap: () {
                    pop(context);
                  },
                  title: '103'.tr,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CustomEditImageProfileScreen(),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        validator: (val) {
                          return validInputFun(
                            val,
                            5,
                            50,
                            'username',
                          );
                        },
                        controller: cubit.nameController,
                        labelText: '27'.tr,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFormField(
                        validator: (val) {
                          return validInputFun(
                            val,
                            10,
                            200,
                            'email',
                          );
                        },
                        controller: cubit.emailController,
                        labelText: '8'.tr,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFormField(
                        validator: (val) {
                          return validInputFun(
                            val,
                            11,
                            11,
                            'phone',
                          );
                        },
                        controller: cubit.phoneController,
                        labelText: '28'.tr,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFormField(
                        validator: (val) {
                          return validInputFun(
                            val,
                            8,
                            100,
                            'password',
                          );
                        },
                        controller: cubit.passwordController,
                        labelText: '10'.tr,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomEditProfileBotton(
                        onTap: () {
                          ProfileCubit.get(context).editProfile(context);
                        },
                        text: '110'.tr,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
