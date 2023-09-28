// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/core/models/products.dart';
import 'package:e_commerce_app/features/cart/presentation/view_data/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors_manager.dart';

class CustomCounterProductDetails extends StatelessWidget {
  const CustomCounterProductDetails({
    super.key,
    required this.productData,
  });

  final Products productData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = CartCubit.get(context);
        return Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  30,
                ),
                color: ColorsManager.grey.withOpacity(
                  .2,
                )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      cubit.deleteQuantity();
                    },
                    child: Icon(
                      Icons.remove,
                      size: 15.sp,
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    '${cubit.quantity}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 15.sp),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  InkWell(
                    onTap: () async {
                      cubit.addQuantity();
                    },
                    child: Icon(
                      Icons.add,
                      size: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
