import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../view_model/checkout_cubit/checkout_cubit.dart';

class OrderSummaryCheckout extends StatelessWidget {
  const OrderSummaryCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        var cubit = CheckoutCubit.get(context);

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
                '128'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorsManager.black, fontSize: 20.sp),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorsManager.grey,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.white,
                  ),
                  margin: const EdgeInsets.all(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '92'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              '\$ ${cubit.subPrice}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: ColorsManager.black,
                                    height: 1.5,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '93'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              '\$ ${cubit.discount}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: ColorsManager.black,
                                    height: 1.5,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '94'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              '\$ ${cubit.shippingCost}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: ColorsManager.black,
                                    height: 1.5,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: .5,
                          width: double.infinity,
                          color: ColorsManager.grey,
                        ),
                        Row(
                          children: [
                            Text(
                              '${'95'.tr} (${cubit.cartCount} ${'96'.tr}) :',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: ColorsManager.primary,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              '\$ ${cubit.sumTotalPrice()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w800,
                                    color: ColorsManager.black,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
