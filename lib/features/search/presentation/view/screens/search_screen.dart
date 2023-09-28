// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/features/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_appbar_search.dart';
import '../widgets/custom_search_products_part.dart';
import '../widgets/custom_search_result_part.dart';
import '../widgets/custom_searchbar_search_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit = SearchCubit.get(context);
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 20.h,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const CustomAppbarSearch(),
                SizedBox(
                  height: 15.h,
                ),
                const CustomSearchbarSearchScreen(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    ConditionalBuilder(
                      condition: cubit.isSearch == false,
                      builder: (context) => const CustomSearchProductsPart(),
                      fallback: (context) => const CustomSearchResultPart(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
