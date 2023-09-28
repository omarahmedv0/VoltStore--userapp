// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/core/functions/translate_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/models/products.dart';

class CustomTitleandPriceSearchProduct extends StatelessWidget {
  CustomTitleandPriceSearchProduct({super.key, required this.products});
  Products products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            translateDataBase( products.productNameAr!,  products.productNameEn!)
           ,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 16.sp, overflow: TextOverflow.ellipsis, height: 1.2),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                '\$${products.productNewPrice}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorsManager.black,
                      fontWeight: FontWeight.w900,
                      height: 1.5,
                      fontSize: 16.sp,
                    ),
              ),
              SizedBox(
                width: 20.w,
              ),
              if (products.productDiscount != '0')
                Text(
                  '\$${products.productOldPrice}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: ColorsManager.black.withOpacity(.6),
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        fontSize: 16.sp,
                      ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
