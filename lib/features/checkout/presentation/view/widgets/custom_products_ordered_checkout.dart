// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/core/functions/language/initial_language.dart';
import 'package:e_commerce_app/features/cart/data/models/cart/cart_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/assets/image_assets_manager.dart';
import 'custom_image_part_checkout.dart';
import 'custom_products_details_checkout.dart';

class CustomProductOrderedCheckout extends StatelessWidget {
  CustomProductOrderedCheckout({super.key, required this.cartProductsData});
  CartProducts cartProductsData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
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
                    CustomImagePartCheckout(cartProductsData: cartProductsData),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomProductDetailsPartCheckout(
                      cartProductsData: cartProductsData,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (cartProductsData.productDescount != '0')
          if(lange =='en')
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(
                ImageAssetsManager.sale,
                width: 40.w,
                height: 40.h,
              ),
            ),
         if (cartProductsData.productDescount != '0')
          if(lange =='ar')
           Positioned(
              right: 0,
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
