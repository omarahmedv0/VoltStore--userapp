// ignore_for_file: must_be_immutable
import 'package:e_commerce_app/core/functions/language/initial_language.dart';
import 'package:e_commerce_app/core/models/products.dart';
import 'package:e_commerce_app/features/search/presentation/view_model/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/assets/image_assets_manager.dart';
import '../../../../../core/constants/colors_manager.dart';
import 'custom_image_searchproduct.dart';
import 'custom_title_and_price_searchproduct.dart';

class CustomItemSearch extends StatelessWidget {
  CustomItemSearch({super.key, required this.products});

  Products products;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {},
      child: InkWell(
        onTap: () {
          SearchCubit.get(context).toProductDetailsScreen(
            context,
            products,
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height / 7,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorsManager.white,
                  boxShadow: [
                    BoxShadow(
                      color: ColorsManager.grey.withOpacity(.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(
                        0,
                        3,
                      ),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            CustomImageSearchProduct(products: products),
                            SizedBox(
                              width: 10.w,
                            ),
                            CustomTitleandPriceSearchProduct(products: products),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               if(products.productDiscount != '0')
               if(lange == 'en')
              Positioned(
                left: 0,
                top: 0,
                child: Image.asset(
                  ImageAssetsManager.sale,
                width: 35.w,
                height: 35.h,
                ),
              ),
               if(products.productDiscount != '0')
               if(lange == 'ar')
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  ImageAssetsManager.sale,
                width: 35.w,
                height: 35.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
