import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/class/custom_divider.dart';
import '../../../../../core/class/handling/handling_state_view.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../layout/view_model/cubit/app_layout_cubit.dart';
import '../../view_data/myrating_cubit/my_rating_cubit.dart';
import '../widgets/custom_myrating_item.dart';

class MyratingScreen extends StatelessWidget {
  const MyratingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRatingCubit, MyRatingState>(
      builder: (context, state) {
        var cubit = MyRatingCubit.get(context);
        return Scaffold(
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomAppBar(
                  ispadding: true,
                isleading: true,
                title: '107'.tr,
                onTap: () {
                  toNamed(
                    context,
                    RouteManager.layout,
                  );
                  AppLayoutCubit.get(context).currentPage = 3;
                },
              ),
              HandlingStateView(
                  conditionEmpty: cubit.myratingData.data.isEmpty,
                  conditionError: state is GetMyratingDataFailere,
                  conditionLoading: state is GetMyratingDataLoading,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => CustomMyratingItem(
                      myratingData: cubit.myratingData.data[index],
                    ),
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                      ),
                      child: customDivider(
                        vertical: 5.h,
                      ),
                    ),
                    itemCount: cubit.myratingData.data.length,
                  ))
            ],
          ),
        );
      },
    );
  }
}
