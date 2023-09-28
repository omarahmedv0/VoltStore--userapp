import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/class/handling/handling_state_view.dart';
import '../../../../../../core/constants/route_manager.dart';
import '../../../../../../core/functions/navigation/to_named.dart';
import '../../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../../layout/view_model/cubit/app_layout_cubit.dart';
import '../../../../shared/widgets/custom_order_item.dart';
import '../../view_data/cubit/myorders_cubit.dart';

class MyordersScreen extends StatelessWidget {
  const MyordersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyordersCubit, MyordersState>(
      builder: (context, state) {
        var cubit = MyordersCubit.get(context);
        return Scaffold(
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomAppBar(
                onTap: () {
                  toNamed(
                    context,
                    RouteManager.layout,
                  );
                  AppLayoutCubit.get(context).currentPage = 3;
                },
                title: '104'.tr,
                ispadding: true,
                isleading: true,
              ),
              HandlingStateView(
                  conditionEmpty: cubit.ordersData.orderData.isEmpty,
                  conditionError: state is GetOrdersFailere,
                  conditionLoading: state is GetOrdersLoading,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.0.w,
                      right: 20.0.w,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => CustomOrderItem(
                        orderData: cubit.ordersData.orderData[index],
                      ),
                      itemCount: cubit.ordersData.orderData.length,
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
