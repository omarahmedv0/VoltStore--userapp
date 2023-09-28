import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../address/presentation/view_model/address_cubit/address_cubit.dart';
import 'custom_select_address_item_checkout.dart';

class SelectAddressCheckout extends StatelessWidget {
  const SelectAddressCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '164'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorsManager.black, fontSize: 20.sp),
              ),
              ConditionalBuilder(
                condition: state is GetAddressDataLoading,
                builder: (context) => Column(
                  children: [
                    Center(
                      child: Lottie.asset(
                        LottieAssetsManager.loading,
                        width: 300,
                        height: 450,
                      ),
                    ),
                  ],
                ),
                fallback: (context) => ConditionalBuilder(
                  condition: AddressCubit.get(context).addressData.data.isEmpty,
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     Align(
                        alignment: Alignment.center,
                        child: Text(
                          '171'.tr,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith((states) => ColorsManager.primary),
                        ),
                          onPressed: () {
                            toNamed(
                              context,
                              RouteManager.mapAddress,
                            );
                          },
                          child: Text('172'.tr)),
                    ],
                  ),
                  fallback: (context) => ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        CustomSelectAddressItemCheckout(
                      addressData:
                          AddressCubit.get(context).addressData.data[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount:
                        AddressCubit.get(context).addressData.data.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
