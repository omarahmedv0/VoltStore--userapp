
import '../../../data/models/cart/cart_products.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/colors_manager.dart';

class CustomImageCart extends StatelessWidget {
  const CustomImageCart({
    super.key,
    required this.productData,
  });

  final CartProducts productData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: ColorsManager.grey.withOpacity(.19),
        child: Image.network(
          '${ApiLinks.productsImagesLink}/${productData.productImage!}',
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 7,
        ),
      ),
    );
  }
}
