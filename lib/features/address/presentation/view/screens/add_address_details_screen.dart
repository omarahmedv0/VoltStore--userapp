import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/to_named_and_remove_until.dart';
import '../../../../../core/functions/valid_input/valid_input_fun.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../layout/view_model/cubit/app_layout_cubit.dart';
import '../../view_model/add_address/add_address_cubit.dart';
import '../widgets/address_details/custom_botton_save_addressdetails.dart';
import '../widgets/address_details/custom_drop_botton_addaddress.dart';

class AddAddressDetails extends StatelessWidget {
  const AddAddressDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAddressCubit, AddAddressState>(
      builder: (context, state) {
        Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
        String lat = arguments['lat'];
        String long = arguments['long'];
        var cubit = AddAddressCubit.get(context);
        return SafeArea(
            child: Scaffold(
          body: Form(
            key: cubit.formKey,
            child: Container(
              margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
              child: ListView(
                children: [
                  CustomAppBar(
                    ispadding: true,
                    isleading: true,
                    title: '158'.tr,
                    onTap: () {
                      toNamedandRemoveUntil(
                        context,
                        RouteManager.layout,
                      );
                      AppLayoutCubit.get(context).currentPage = 3;
                    },
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
                  const CustomDropBottonAddAddress(),
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
                    labelText: 'Addetional Details',
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomBottonSaveAddress(
                    lat: lat,
                    long: long,
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
