import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../../../home/data/model/home/categories_data.dart';
import '../../view_model/products_cubit/products_cubit.dart';

// ignore: must_be_immutable
class CustomItemOfCategoriesProducts extends StatelessWidget {
  CustomItemOfCategoriesProducts({
    super.key,
    required this.categories,
    required this.index,
  });
  Categories categories;
  int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        var cubit = ProductsCubit.get(context);
        return InkWell(
          onTap: () {
            cubit.changeCatSelected(index,context);
          },
          child: Container(
            decoration: cubit.categorySelectedIndex == index
                ? BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: ColorsManager.primary, width: 3.w)))
                : null,
            child: Text(
              '${translateDataBase(categories.categoryNameAr,categories.categoryNameEn)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        );
      },
    );
  }
}
