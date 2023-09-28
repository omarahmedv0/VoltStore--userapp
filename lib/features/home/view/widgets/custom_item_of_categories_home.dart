import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/api_links.dart';
import '../../../../core/constants/colors_manager.dart';
import '../../../../core/functions/translate_database.dart';
import '../../data/model/home/categories_data.dart';
import '../../view_model/home_cubit/home_cubit.dart';

// ignore: must_be_immutable
class CustomItemOfCategoriesHome extends StatelessWidget {
  CustomItemOfCategoriesHome({
    super.key,
    required this.categories,
    required this.categorySelectedIndex,
  });

  Categories categories;
  int categorySelectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return InkWell(
          onTap: () {
            cubit.setCategorySelectedIndex(categorySelectedIndex);
            cubit.setCategorySelectedId(categories.categoryId!);
            cubit.goToProductsScreen(context,cubit.homeData.categories);
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorsManager.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.network(
                    '${ApiLinks.categoriesImageLink}/${categories.image}',
                    height: 25.h,
                    width: 25.w,
                  ),
                ),
              ),
              Text(
                '${translateDataBase(categories.categoryNameAr, categories.categoryNameEn)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        );
      },
    );
  }
}
