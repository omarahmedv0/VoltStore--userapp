
// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/features/cart/data/models/cart/cart_products.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/colors_manager.dart';

class CustomImagePartCheckout extends StatelessWidget {
   CustomImagePartCheckout({
    super.key,
  required this.cartProductsData
  });
CartProducts cartProductsData;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: ColorsManager.grey.withOpacity(.19),
        child: Image.network(
         '${ApiLinks.productsImagesLink}/${cartProductsData.productImage}',
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 7,
        ),
      ),
    );
  }
}
