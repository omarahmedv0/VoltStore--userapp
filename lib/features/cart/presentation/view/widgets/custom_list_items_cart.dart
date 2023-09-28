// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/features/cart/data/models/cart/cart_products.dart';
import 'package:flutter/material.dart';

import 'custom_item_cart.dart';

class CustomListItemsCart extends StatelessWidget {
  CustomListItemsCart({
    super.key,
    required this.productData,
  });

  List<CartProducts> productData;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: productData.length,
      itemBuilder: (context, index) => CustomItemCart(
        productData: productData[index],
      ),
    );
  }
}
