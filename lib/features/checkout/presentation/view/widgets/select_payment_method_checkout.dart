
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import 'custom_cash_on_delivery_bottom.dart';
import 'custom_payment_card_botton_checkout.dart';

class SelectPaymentMethodCheckout extends StatelessWidget {
  const SelectPaymentMethodCheckout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            '166'.tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: ColorsManager.black, fontSize: 20.sp),
          ),
          const CustomCashonDeliveryBottonCheckout(),
          SizedBox(
            height: 10.h,
          ),
          const CustomPaymentCardBottonCheckout(),
        ],
      ),
    );
  }
}
