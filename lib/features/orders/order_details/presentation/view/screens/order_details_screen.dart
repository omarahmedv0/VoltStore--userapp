import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/class/custom_divider.dart';
import '../../../../../../core/constants/assets/lottie_assets_manager.dart';
import '../../../../../../core/functions/navigation/pop.dart';
import '../../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../shared/functions/check_color_status_order.dart';
import '../../../../shared/functions/check_status_order.dart';
import '../../view_data/cubit/order_details_cubit.dart';
import '../widgets/custom_address_part_order_details.dart';
import '../widgets/custom_order_summary_order_details.dart';
import '../widgets/custom_payment_method_order_details.dart';
import '../widgets/custom_phone_part_order_details.dart';
import '../widgets/custom_product_order_details.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
      var cubit = OrderDetailsCubit.get(context);
      return ConditionalBuilder(
        condition: state is GetOrderDetailsLoading,
        builder: (context) => Center(
          child: Lottie.asset(
            LottieAssetsManager.loading,
            width: 300,
            height: 450,
          ),
        ),
        fallback: (context) => SafeArea(
          child: Scaffold(
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CustomAppBar(
                    ispadding: true,
                isleading: true,
                  title: '126'.tr,
                  onTap: () {
                    pop(context);
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${'111'.tr} #${cubit.orderDetailsData!.orderDetails!.orderId}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${'117'.tr} ${cubit.orderDetailsData!.orderDetails!.orderDatetime}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                customDivider(),
                CustomAddressPartOrderDetails(
                  orderDetails: cubit.orderDetailsData!.addressDetails!,
                ),
                customDivider(),
                CustomPhoneNumberPartOrderDetails(
                  phoneNumber: cubit
                      .orderDetailsData!.addressDetails!.addressPhoneNumber!,
                ),
                customDivider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    checkStateOrder(
                      cubit.orderDetailsData!.orderDetails!.orderStatus!,
                    ),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: changeColorStatusOrder(
                            cubit.orderDetailsData!.orderDetails!.orderStatus!,
                          ),
                          fontSize: 20.sp,
                        ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cubit.orderDetailsData!.productsDetails!.length,
                  itemBuilder: (context, index) =>
                      CustomProductItemOrderDetails(
                    orderDetailsData:
                        cubit.orderDetailsData!.productsDetails![index],
                    orderStatus:
                        cubit.orderDetailsData!.orderDetails!.orderStatus!,
                    orderID: cubit.orderDetailsData!.orderDetails!.orderId!,
                  ),
                ),
                customDivider(),
                CustomPaymentMethodOrderDetails(
                  paymentMethod:
                      cubit.orderDetailsData!.orderDetails!.orderPaymentmethod!,
                ),
                CustomOredrSummaryOrderDetails(
                  orderDetails: cubit.orderDetailsData!.orderDetails!,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
