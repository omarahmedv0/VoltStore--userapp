// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/features/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/assets/icon_assets_manager.dart';
import '../../../../../core/constants/colors_manager.dart';

class CustomSearchBottonSearchScreen extends StatelessWidget {
  const CustomSearchBottonSearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
      },
      child: InkWell(
        onTap: () async{
         await SearchCubit.get(context).getSearchData();
          SearchCubit.get(context).changeStateScreen();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              180,
            ),
            color: ColorsManager.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Image.asset(
              IconsAssetsManager.search,
              width: 24.w,
              height: 24.h,
              color: ColorsManager.white,
            ),
          ),
        ),
      ),
    );
  }
}
