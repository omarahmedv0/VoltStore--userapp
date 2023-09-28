// ignore_for_file: avoid_print
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce_app/core/constants/assets/lottie_assets_manager.dart';
import 'package:e_commerce_app/features/products_details/presentation/view_model/cubit/product_details_cubit.dart';
import 'package:e_commerce_app/features/rating/presentation/view_data/products_reviews_cubit/products_reviews_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../widgets/custom_botton_navigationbar_productdetails.dart';
import '../widgets/custom_color_part_product_details.dart';
import '../widgets/custom_desc_part_product_details.dart';
import '../widgets/custom_part_counter_state_product_details.dart';
import '../widgets/custom_part_title_review_product_details.dart';
import '../widgets/custom_size_part_products_details.dart';
import '../widgets/custom_sliver_appbar_products_details.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        var cubit = ProductDetailsCubit.get(context);
        cubit.initialData(context);
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: CustomBottonNavigationbarProductDetails(
              productDetails: cubit.productDetails!,
            ),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              slivers: [
                CustomSliverAppbarProductDetails(
                  productDetails: cubit.productDetails!,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        padding: const EdgeInsets.only(
                          right: 14,
                          left: 14,
                          top: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: ColorsManager.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                BlocBuilder<ProductsReviewsCubit,
                                    ProductsReviewsState>(
                                  builder: (context, state) {
                                    return ConditionalBuilder(
                                      condition:
                                          state is GetProductsReviewsLoading,
                                      builder: (context) => Column(
                                        children: [
                                          Center(
                                            child: Lottie.asset(
                                              LottieAssetsManager.loading,
                                              width: 20,
                                              height: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                      fallback: (context) =>
                                          CustomPartTitleReviewProductDetails(
                                        productDetails: cubit.productDetails!,
                                      ),
                                    );
                                  },
                                ),
                                CustomPartCounterandStateProductDetails(
                                  productDetails: cubit.productDetails!,
                                ),
                              ],
                            ),
                            Text(
                              '148'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Row(
                              children: [
                                CustomSizePartProductDetails(
                                  size: cubit.productSize,
                                ),
                                const Spacer(),
                                CustomColorPartProductDetails(
                                  colorsName: cubit.productColors,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            CustomDescPartProductDetails(
                              productDetails: cubit.productDetails!,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
