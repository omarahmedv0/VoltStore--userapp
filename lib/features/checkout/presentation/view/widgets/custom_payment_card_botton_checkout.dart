import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../view_model/checkout_cubit/checkout_cubit.dart';

class CustomPaymentCardBottonCheckout extends StatelessWidget {
  const CustomPaymentCardBottonCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CheckoutCubit.get(context).paymentMethod == 'card'
                ? ColorsManager.primary
                : ColorsManager.grey,
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
                  InkWell(
                    onTap: () {
                      CheckoutCubit.get(context).selectPaymentMethod('card');
                    },
                    child: Row(
                      children: [
                        CheckoutCubit.get(context).paymentMethod == 'card'
                            ? const Icon(
                                Icons.circle,
                                color: ColorsManager.primary,
                              )
                            : Icon(
                                Icons.circle_outlined,
                                color: ColorsManager.black.withOpacity(.6),
                              ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '125'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: ColorsManager.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          Icons.payment_outlined,
                          color: ColorsManager.black.withOpacity(.6),
                        ),
                      ],
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
