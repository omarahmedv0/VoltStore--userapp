// ignore_for_file: must_be_immutable
import 'package:e_commerce_app/core/constants/colors_manager.dart';
import 'package:e_commerce_app/core/constants/route_manager.dart';
import 'package:e_commerce_app/core/functions/navigation/to_named.dart';
import 'package:e_commerce_app/features/address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:e_commerce_app/features/orders/myorders/presentation/view_data/cubit/myorders_cubit.dart';
import 'package:e_commerce_app/features/orders/order_details/presentation/view_data/cubit/order_details_cubit.dart';
import 'package:e_commerce_app/features/orders/shared/functions/check_color_status_order.dart';
import 'package:e_commerce_app/features/orders/shared/functions/check_payment_order.dart';
import 'package:e_commerce_app/features/orders/shared/functions/check_status_order.dart';
import 'package:e_commerce_app/features/orders/shared/models/order_model/order_data.dart';
import 'package:e_commerce_app/features/rating/presentation/view_data/myrating_cubit/my_rating_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomOrderItem extends StatelessWidget {
  CustomOrderItem({super.key, required this.orderData});
  OrderData orderData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${'111'.tr} #${orderData.orderId}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20.sp, height: 1),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${'117'.tr}${orderData.orderDatetime!}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: 1.5,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            Container(
              height: .5,
              color: ColorsManager.black.withOpacity(.4),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${'112'.tr} ${orderData.orderSubprice} \$',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.black,
                    height: 1.5,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            Text(
              '${'94'.tr} ${orderData.orderDeliveryprice} \$',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.black,
                    height: 1.5,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            Text(
              '${'114'.tr} ${checkPaymentOrder(orderData.orderPaymentmethod!)}',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.black,
                    height: 1.5,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            Row(
              children: [
                Text(
                  checkStateOrder(
                    orderData.orderStatus!,
                  ),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: changeColorStatusOrder(
                          orderData.orderStatus!,
                        ),
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20.sp,
                        height: 1.5,
                      ),
                ),
                const Spacer(),
                if (orderData.orderStatus! == '0')
                  InkWell(
                    onTap: () async {
                      await MyordersCubit.get(context).cancelOrder(
                        context,
                        orderData.orderId!,
                      );
                    },
                    child: Container(
                      width: 75.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180),
                        color: ColorsManager.red,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '72'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    color: ColorsManager.white,
                                  ),
                            ),
                          ]),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () async {
                await MyRatingCubit.get(context).getRatingData().then((value) {
                  OrderDetailsCubit.get(context).getOrderDetails(
                    context,
                    orderData.orderId!,
                  );
                  AddressCubit.get(context).getCities();
                }).then((value) {
                  toNamed(
                    context,
                    RouteManager.orderDetails,
                  );
                });
              },
              child: Container(
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  color: ColorsManager.black,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      '${'115'.tr} ${orderData.orderTotalprice}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorsManager.white,
                          ),
                    ),
                    const Spacer(),
                    Container(
                      width: 100.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(180),
                        color: ColorsManager.primary,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '116'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    color: ColorsManager.white,
                                  ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
