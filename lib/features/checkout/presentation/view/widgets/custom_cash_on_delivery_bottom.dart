import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../view_model/checkout_cubit/checkout_cubit.dart';

class CustomCashonDeliveryBottonCheckout extends StatelessWidget {
  const CustomCashonDeliveryBottonCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            CheckoutCubit.get(context).selectPaymentMethod('cash');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CheckoutCubit.get(context).paymentMethod == 'cash'
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
                child: Row(
                  children: [
                    CheckoutCubit.get(context).paymentMethod == 'cash'
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
                              '124'.tr,
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
                      Icons.delivery_dining_outlined,
                      color: ColorsManager.black.withOpacity(.6),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
