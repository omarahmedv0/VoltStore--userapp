import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handling/handling_state_view.dart';
import '../../../../../core/functions/navigation/pop.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../view_data/products_reviews_cubit/products_reviews_cubit.dart';
import '../widgets/custom_product_review.dart';
import '../widgets/custom_review_item.dart';

class ProductsReviewsScreen extends StatelessWidget {
  const ProductsReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsReviewsCubit, ProductsReviewsState>(
      builder: (context, state) {
        var cubit = ProductsReviewsCubit.get(context);
        cubit.initialData(context);
        return Scaffold(
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomAppBar(
                  ispadding: true,
                isleading: true,
                title: '151'.tr,
                onTap: () {
                  pop(context);
                },
              ),
              Padding(
                padding: EdgeInsets.all(20.0.w),
                child: Column(
                  children: [
                    CustomProductReview(
                      avrgRate: cubit.productsReviewsData.avrgStars.toString(),
                      countReviews: cubit.productsReviewsData.countReviews!,
                      product: cubit.productDetails!,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    HandlingStateView(
                        conditionEmpty: cubit.productsReviewsData.data.isEmpty,
                        conditionError: state is GetProductsReviewsFailere,
                        conditionLoading: state is GetProductsReviewsLoading,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 15.h,
                          ),
                          itemBuilder: (context, index) => CustomReviewItem(
                            productsReviewsData:
                                cubit.productsReviewsData.data[index], productID: cubit.productDetails!.productId!,
                          ),
                          itemCount: cubit.productsReviewsData.data.length,
                        ))
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
