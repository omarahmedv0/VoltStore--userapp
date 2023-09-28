import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handling/handling_state_view.dart';
import '../../view_model/cubit/search_cubit.dart';
import 'custom_item_search.dart';

class CustomSearchResultPart extends StatelessWidget {
  const CustomSearchResultPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return HandlingStateView(
          conditionEmpty: cubit.searchModel.data.isEmpty,
          conditionError: state is GetSearchDataFailere,
          conditionLoading: state is GetSearchDataSuccess,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '90'.tr,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15.h,
              ),
              ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cubit.searchModel.data.length,
                  itemBuilder: (context, index) {
                    return CustomItemSearch(
                      products: cubit.searchModel.data[index],
                    );
                  }),
            ],
          ),
        );
      },
    );
  }
}
