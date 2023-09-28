
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/home/categories_data.dart';
import 'custom_item_of_categories_home.dart';

class ListOfCategoriesHome extends StatelessWidget {
  ListOfCategoriesHome({
    super.key,
    required this.categories,
  });

  List<Categories> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
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
          
          return CustomItemOfCategoriesHome(
            categories: categories[i],
          categorySelectedIndex: i,
          );
        },
      ),
    );
  }
}
