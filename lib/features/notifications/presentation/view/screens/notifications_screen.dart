import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/class/custom_divider.dart';
import '../../../../../core/class/handling/handling_state_view.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/navigation/to_named_and_remove_until.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../layout/view_model/cubit/app_layout_cubit.dart';
import '../../view_data/cubit/notifications_cubit.dart';
import '../widgets/custom_item_notify.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        NotificationsCubit cubit = NotificationsCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
                top: 15.h, right: 10.w, left: 10.w, bottom: 15.w),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                 CustomAppBar(
                    ispadding: false,
                isleading: true,
                  onTap: () { 
                  
                  toNamedandRemoveUntil(context, RouteManager.layout,);
                  AppLayoutCubit.get(context).currentPage = 0;
                  }, title: '88'.tr,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HandlingStateView(
                        conditionEmpty:
                            cubit.notificationsModel.data.isEmpty,
                        conditionError: state is GetNotificationsFailere,
                        conditionLoading: state is GetNotificationsLoading,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => CustomItemNotify(
                            notificationsModel:
                                cubit.notificationsModel.data[index],
                          ),
                          separatorBuilder: (context, index) => customDivider(),
                          itemCount: cubit.notificationsModel.data.length,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
