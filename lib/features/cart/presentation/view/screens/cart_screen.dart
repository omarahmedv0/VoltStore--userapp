// ignore_for_file: must_be_immutable
import 'package:e_commerce_app/core/shared/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handling/handling_state_view.dart';
import '../../view_data/cubit/cart_cubit.dart';
import '../widgets/custom_bottom_navigation_cart.dart';
import '../widgets/custom_list_items_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = CartCubit.get(context);

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Scaffold(
            bottomNavigationBar: CustomBottomNavigationCart(
              totalData: cubit.cartModel.data.cartData,
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 10.h,
                ),
                 CustomAppBar(
                  ispadding: false,
                  title: '91'.tr,
                  isleading: false,
                  
                 ),
                HandlingStateView(
                  conditionEmpty: cubit.cartModel.data.cartProducts.isEmpty,
                  conditionError: state is GetCartDataFailere,
                  conditionLoading: state is GetCartDataLoading,
                  child: CustomListItemsCart(
                    productData: cubit.cartModel.data.cartProducts,
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
