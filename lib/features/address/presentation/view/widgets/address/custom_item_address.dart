import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/colors_manager.dart';
import '../../../../../../core/functions/language/initial_language.dart';
import '../../../../data/models/address_model/address_data.dart';
import '../../../view_model/address_cubit/address_cubit.dart';

// ignore: must_be_immutable
class CustomItemAddress extends StatelessWidget {
  CustomItemAddress({super.key, required this.addressModel});

  AddressData addressModel;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listener: (context, state) {},
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            right: 15.w,
            left: 15,
            bottom: 20.h,
            top: 20.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    addressModel.addressName!,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      AddressCubit.get(context).toEditScreen(
                        context,
                        addressModel,
                      );
                    },
                    child: Icon(
                      Icons.edit_note_outlined,
                      color: ColorsManager.black,
                      size: 30.sp,
                    ),
                  ),
                 
                 
                ],
              ),
              Container(
                height: .5,
                color: ColorsManager.grey,
              ),
              Row(
                children: [
                  Text(
                    '133'.tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: ColorsManager.black.withOpacity(
                            .8,
                          ),
                        ),
                  ),
                  Text(
                   lange =='en'? addressModel.cityNameEn!:addressModel.cityNameAr!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.black.withOpacity(
                            .6,
                          ),
                        ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '131'.tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: ColorsManager.black.withOpacity(
                            .8,
                          ),
                        ),
                  ),
                  Text(
                    maxLines: 5,
                   addressModel.addressStreet!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.black.withOpacity(
                            .6,
                          ),
                        ),
                  ),
                ],
              ),
              if(addressModel.additionalDetails!='')
              Row(
                children: [
                  Text(
                    '132'.tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: ColorsManager.black.withOpacity(
                            .8,
                          ),
                        ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width /3.2,
                    child: Text(
                      maxLines: 5,
                     addressModel.additionalDetails!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                            color: ColorsManager.black.withOpacity(
                              .6,
                            ),
                          ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '135'.tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                          color: ColorsManager.black.withOpacity(
                            .8,
                          ),
                        ),
                  ),
                  Text(
                    maxLines: 2,
                    addressModel.addressPhoneNumber!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.black.withOpacity(
                            .6,
                          ),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
