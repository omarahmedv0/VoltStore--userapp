import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/to_named_and_remove_until.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../layout/view_model/cubit/app_layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handling/handling_state_view.dart';
import '../../view_model/address_cubit/address_cubit.dart';
import '../widgets/address/custom_item_address.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        var cubit = AddressCubit.get(context);
        return SafeArea(
            child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              cubit.toMapScreen(context);
            },
            child: const Icon(
              Icons.add,
            ),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
            children: [
              CustomAppBar(
                ispadding: true,
                isleading: true,
                title: '106'.tr,
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
              HandlingStateView(
                conditionEmpty: cubit.addressData.data.isEmpty,
                conditionError: state is GetAddressDataFailere,
                conditionLoading: state is GetAddressDataLoading,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cubit.addressData.data.length,
                  itemBuilder: (context, index) => CustomItemAddress(
                    addressModel: cubit.addressData.data[index],
                  ),
                ),
              )
            ],
          ),
        ));
      },
    );
  }
}
