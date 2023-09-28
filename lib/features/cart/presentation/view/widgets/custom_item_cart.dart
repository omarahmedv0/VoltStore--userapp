import '../../../../../core/functions/language/initial_language.dart';
import '../../../data/models/cart/cart_products.dart';
import 'custom_botton_remove_item_from_cart.dart';
import 'custom_quantity_controller_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/assets/image_assets_manager.dart';
import 'custom_image_cart.dart';
import 'custom_cart_product_details.dart';

// ignore: must_be_immutable
class CustomItemCart extends StatelessWidget {
  CustomItemCart({super.key, required this.productData});
  CartProducts productData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 6.3,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CustomImageCart(productData: productData),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomCartProductDtails(productData: productData),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomBottonRemoveItemFromCart(
                          productData: productData,
                        ),
                        const Spacer(),
                        CustomQuantityControllerCart(
                          productData: productData,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (productData.productDescount != '0')
            if (lange == 'ar')
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  ImageAssetsManager.sale,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
          if (productData.productDescount != '0')
            if (lange == 'en')
              Positioned(
                left: 0,
                top: 0,
                child: Image.asset(
                  ImageAssetsManager.sale,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
        ],
      ),
    );
  }
}
