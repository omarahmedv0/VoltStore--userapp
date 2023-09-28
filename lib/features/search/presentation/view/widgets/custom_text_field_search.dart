import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../view_model/cubit/search_cubit.dart';

class CustomTextFormFieldSearch extends StatelessWidget {
  const CustomTextFormFieldSearch({
    Key? key,
    controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
      },
      child: TextFormField(
        controller: SearchCubit.get(context).searchController,
        onChanged: (value) {
          SearchCubit.get(context).checkisSearch(value);
        },
        cursorColor: ColorsManager.primary,
        keyboardType: TextInputType.text,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w500,
              color: ColorsManager.black.withOpacity(.8),
              fontSize: 15.sp,
              height: 1,
            ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              180,
            ),
            borderSide: const BorderSide(
              color: ColorsManager.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              180,
            ),
            borderSide: const BorderSide(
              color: ColorsManager.grey,
            ),
          ),
          hintText: '89'.tr,
          hintStyle: Theme.of(context).textTheme.labelMedium,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}
