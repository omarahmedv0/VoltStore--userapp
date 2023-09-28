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
import '../../view_data/cubit/order_received_cubit.dart';

class OrdersReceivedScreen extends StatelessWidget {
  const OrdersReceivedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderReceivedCubit, OrderReceivedState>(
      builder: (context, state) {
        var cubit = OrderReceivedCubit.get(context);
        return Scaffold(
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomAppBar(
                  ispadding: true,
                isleading: true,
                onTap: () {
                  toNamed(
                    context,
                    RouteManager.layout,
                  );
                  AppLayoutCubit.get(context).currentPage = 3;
                },
                title: '105'.tr,
              ),
              HandlingStateView(
                  conditionEmpty: cubit.ordersData.orderData.isEmpty,
                  conditionError: state is GetOrdersReceivedFailere,
                  conditionLoading: state is GetOrdersReceivedLoading,
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
