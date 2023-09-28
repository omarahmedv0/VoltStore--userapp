import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/assets/image_assets_manager.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/models/products.dart';
import 'custom_fav_botton_product_details.dart';
import 'custom_leading_icon_product_details.dart';

// ignore: must_be_immutable
class CustomSliverAppbarProductDetails extends StatelessWidget {
  CustomSliverAppbarProductDetails({
    super.key,
    required this.productDetails,
  });
  Products productDetails;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400,
      pinned: true,
      stretch: true,
      automaticallyImplyLeading: false,
      leading: const CustomLeadingIconProductDetails(),
      backgroundColor: ColorsManager.background,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: productDetails.productId!,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                '${ApiLinks.productsImagesLink}/${productDetails.productImage}',
              ),
              CustomFavBottonProductDetails(
                productDetails: productDetails,
              ),
               if(productDetails.productDiscount != '0')
              Positioned(
                left: 30,
                top: 30,
                child: Image.asset(
                  ImageAssetsManager.sale,
                width: 65.w,
                height: 65.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
