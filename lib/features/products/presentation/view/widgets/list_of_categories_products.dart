
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home/data/model/home/categories_data.dart';
import 'custom_item_of_categories_products.dart';


class ListOfCategoriesProducts extends StatelessWidget {
  ListOfCategoriesProducts({
    super.key,
    required this.categories,
  });

  List<Categories> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 25.w,
          );
        },
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, i) {
          return CustomItemOfCategoriesProducts(
          categories: categories[i],
          index: i,
          );
        },
      ),
    );
  }
}
