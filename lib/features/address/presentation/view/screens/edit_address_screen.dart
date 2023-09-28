// ignore_for_file: unrelated_type_equality_checks

import 'package:e_commerce_app/core/class/handling/handling_state_view.dart';
import 'package:e_commerce_app/core/functions/navigation/pop.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_appbar.dart';
import 'package:e_commerce_app/features/address/presentation/view/widgets/address_edit/custom_botton_save_edit_address.dart';
import 'package:e_commerce_app/features/address/presentation/view/widgets/address_edit/custom_drop_botton_editaddress.dart';
import 'package:e_commerce_app/features/address/presentation/view_model/address_edit/edit_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/functions/valid_input/valid_input_fun.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAddressCubit, EditAddressState>(
      builder: (context, state) {
        var cubit = EditAddressCubit.get(context);
        cubit.initialData(context);
        return HandlingStateView(
            conditionEmpty: false,
            conditionError: state is GetCitiesDataFailere,
            conditionLoading: state is GetCitiesDataLoading,
            child: SafeArea(
                child: Scaffold(
              body: Form(
                key: cubit.formKey,
                child: Container(
                  margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
                  child: ListView(
                    children: [
                      CustomAppBar(
                        ispadding: false,
                        isleading: true,
                        title: '137'.tr,
                        onTap: () {
                        pop(context);
                        },
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return '12'.tr;
                              }
                              return null;
                            },
                            controller: cubit.nameController,
                            labelText: '136'.tr,
                          ),
                          SizedBox(
                            height: 20.h,
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
                            height: 20.h,
                          ),
                          const Row(
                            children: [
                              Expanded(
                                child: CustomDropBottonEditAddress(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return '12'.tr;
                              }
                              return null;
                            },
                            controller: cubit.streetController,
                            labelText: '139'.tr,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextFormField(
                            controller: cubit.addetionalDetailsController,
                            labelText: '132'.tr,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          const CustomBottonSaveEditAddress(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
      },
    );
  }
}
