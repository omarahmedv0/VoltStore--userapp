
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/colors_manager.dart';
import '../../../view_model/map_cubit/map_cubit.dart';
import '../../../view_model/map_cubit/map_state.dart';

class CustomBottontoAddressDetails extends StatelessWidget {
  const CustomBottontoAddressDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapCubit, MapState>(
      listener: (context, state) {
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                right: 50.w,
                left: 50.w,
                bottom: 10.h,
              ),
              decoration: BoxDecoration(
                  color: ColorsManager.primary,
                  borderRadius: BorderRadius.circular(15)),
              child: TextButton(
                  onPressed: () {  
                    MapCubit.get(context).toAddressDetails(context);
                  },
                  child: Text(
                    '159'.tr,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: ColorsManager.white,
                        ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
