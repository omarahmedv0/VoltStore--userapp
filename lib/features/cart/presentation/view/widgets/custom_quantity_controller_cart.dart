import '../../../../../core/constants/colors_manager.dart';
import '../../../data/models/cart/cart_products.dart';
import '../../view_data/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomQuantityControllerCart extends StatelessWidget {
  const CustomQuantityControllerCart({super.key, required this.productData});
  final CartProducts productData;

  @override
  Widget build(BuildContext context) {
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
                  if (productData.countitems.toString() == '1') {
                    CartCubit.get(context).deleteCart(
                      productData.productId,
                      productData.productColor!,
                      productData.productSize!,
                      context,
                    );
                  } else {
                    CartCubit.get(context).decreaseQuaintity(
                        productData.productId,
                        productData.productColor!,
                        productData.productSize!,
                        context);
                  }
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
                productData.countitems.toString(),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 15.sp,
                    ),
              ),
              SizedBox(
                width: 3.w,
              ),
              InkWell(
                onTap: () async {
                  CartCubit.get(context).increaseQuantity(
                      productData.productId,
                      productData.productColor!,
                      productData.productSize!,
                      context);
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
  }
}
