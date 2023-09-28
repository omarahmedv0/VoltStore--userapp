// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/features/address/presentation/view_model/address_cubit/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../../../address/data/models/address_model/address_data.dart';
import '../../view_model/checkout_cubit/checkout_cubit.dart';

class CustomSelectAddressItemCheckout extends StatelessWidget {
  CustomSelectAddressItemCheckout({super.key, required this.addressData});
  AddressData addressData;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            CheckoutCubit.get(context)
                .selectAddress(addressData.addressNo!, addressData.cityId!);
            CheckoutCubit.get(context).getShippingCost(
              context,
              addressData.cityId!,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CheckoutCubit.get(context).addressSelected ==
                      addressData.addressNo
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
                    const Icon(
                      Icons.pin_drop_outlined,
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.4,
                              child: Text(
                                '${AddressCubit.get(context).getCityName(addressData.cityId!)}, ${addressData.addressStreet}, ${addressData.additionalDetails}',
                                maxLines: 3,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: ColorsManager.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w300,
                                      height: 1.1,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          addressData.addressPhoneNumber!,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: ColorsManager.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300,
                                    height: 1.2,
                                  ),
                        ),
                      ],
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
