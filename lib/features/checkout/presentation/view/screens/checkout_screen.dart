import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../view_model/checkout_cubit/checkout_cubit.dart';
import '../../view_model/payment_cubit/payment_cubit.dart';
import '../widgets/custom_bottm_navigation_checkout.dart';
import '../widgets/order_summary_checkout.dart';
import '../widgets/products_ordered_checkout.dart';
import '../widgets/select_address_checkout.dart';
import '../widgets/select_payment_method_checkout.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        CheckoutCubit.get(context).initialData(context);
        return BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            return SafeArea(
                child: Scaffold(
              bottomNavigationBar: const CustomBottomNavigationCheckout(),
              body: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomAppBar(
                      ispadding: true,
                isleading: true,
                    title: '163'.tr,
                    onTap: () {
                      pop(context);
                    },
                  ),
                  const SelectAddressCheckout(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5.h,
                    color: ColorsManager.background,
                  ),
                  const SelectPaymentMethodCheckout(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5.h,
                    color: ColorsManager.background,
                  ),
                  const OrderSummaryCheckout(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5.h,
                    color: ColorsManager.background,
                  ),
                  const ProductsOrderedCheckout(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ));
          },
        );
      },
    );
  }
}
