import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handling/handling_state_view.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../../../home/data/model/home/categories_data.dart';
import '../../view_model/products_cubit/products_cubit.dart';
import '../widgets/custom_list_of_products.dart';
import '../widgets/list_of_categories_products.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
        List<Categories> categories = arguments['categories'];
        var cubit = ProductsCubit.get(context);
        return SafeArea(
            child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 10.h,
                ),
                CustomAppBar(
                    ispadding: false,
                isleading: true,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  title: '81'.tr,
                ),
                ListOfCategoriesProducts(
                  categories: categories,
                ),
                SizedBox(
                  height: 20.h,
                ),
                HandlingStateView(
                  conditionEmpty: cubit.productsData.products.isEmpty == true,
                  conditionLoading: state is GetProductsDataLoading,
                  conditionError: state is GetProductsDataFailere,
                  child: ListOfProducts(
                    products: cubit.productsData.products,
                  ),
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
