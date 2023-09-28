
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handling/handling_state_view.dart';
import '../../../../products/presentation/view_model/products_cubit/products_cubit.dart';
import 'custom_item_search.dart';

class CustomSearchProductsPart extends StatelessWidget {
  const CustomSearchProductsPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        var productCubit = ProductsCubit.get(context);
        return HandlingStateView(
          conditionEmpty: productCubit.productsData.products.isEmpty,
          conditionError: state is GetProductsDataFailere,
          conditionLoading: state is GetProductsDataLoading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '81'.tr,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15.h,
              ),
              ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productCubit.productsData.products.length,
                  itemBuilder: (context, index) {
                    return CustomItemSearch(
                        products: productCubit.productsData.products[index]);
                  }),
            ],
          ),
        );
      },
    );
  }
}
