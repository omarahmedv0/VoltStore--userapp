
import 'package:flutter/material.dart';

import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/models/products.dart';

// ignore: must_be_immutable
class CustomImageSearchProduct extends StatelessWidget {
   CustomImageSearchProduct({
    super.key,
    required this.products
  });

  Products products;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: ColorsManager.grey.withOpacity(.19),
        child: Image.network(
          '${ApiLinks.productsImagesLink}/${products.productImage}',
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 7,
        ),
      ),
    );
  }
}
