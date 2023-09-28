import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors_manager.dart';
import '../../../../core/functions/alert_exit_app.dart';
import '../../view_model/cubit/app_layout_cubit.dart';
import '../widgets/custom_icon_bottom.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLayoutCubit, AppLayoutState>(
      builder: (context, state) {
        var cubit = AppLayoutCubit.get(context);
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(bottom: 15.h, left: 22.w, right: 22.w),
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorsManager.black.withOpacity(.7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        cubit.listPages.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: CustomIconBottom(
                            selected: cubit.currentPage == index ? true : false,
                            onPressed: () {
                              cubit.changeCurrentPage(index);
                            },
                            icon: cubit.iconPages[index],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: WillPopScope(
                onWillPop: () => alertExitApp(context),
                child: cubit.listPages[cubit.currentPage]),
          ),
        );
      },
    );
  }
}
/*  */