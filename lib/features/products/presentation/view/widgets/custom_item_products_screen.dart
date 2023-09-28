import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/assets/icon_assets_manager.dart';
import '../../../../../core/constants/assets/image_assets_manager.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../../../favorite/presentation/view_data/cubit/favorite_cubit.dart';
import '../../../../products_details/presentation/view_model/cubit/product_details_cubit.dart';
import '../../../../rating/presentation/view_data/products_reviews_cubit/products_reviews_cubit.dart';
import '../../../data/models/products_data.dart';
import '../../view_model/products_cubit/products_cubit.dart';

// ignore: must_be_immutable
class CustomItemProductsScreen extends StatelessWidget {
  CustomItemProductsScreen({
    super.key,
    required this.products,
  });

  ProductsData products;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      child: InkWell(
        onTap: () async {
          await ProductsReviewsCubit.get(context)
              .getProductReviewsData(products.productId!)
              .then((value) {
            ProductDetailsCubit.get(context)
                .getProductColors(products.productId!);
            ProductDetailsCubit.get(context)
                .getProductSize(products.productId!);
          }).then((value) {
            ProductsCubit.get(context)
                .goToProductDetailsScreen(context, products);
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorsManager.grey.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Hero(
                      tag: products.productId!,
                      child: Image.network(
                        '${ApiLinks.productsImagesLink}/${products.productImage}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    var cubit = FavoriteCubit.get(context);
                    return CircleAvatar(
                      radius: 17,
                      backgroundColor:
                          cubit.isFavorite[products.productId] == '1'
                              ? ColorsManager.primary
                              : ColorsManager.white,
                      child: IconButton(
                        splashRadius: 1,
                        onPressed: () {
                          cubit.changeStateIconFav(
                              products.productId!, context);
                        },
                        icon: Image.asset(
                          IconsAssetsManager.heart,
                          color: cubit.isFavorite[products.productId] == '1'
                              ? ColorsManager.white
                              : ColorsManager.primary,
                          height: 25.h,
                          width: 25.w,
                        ),
                      ),
                    );
                  },
                ),
                if (products.productDiscount != '0')
                  Positioned(
                    left: -10,
                    top: -27,
                    child: Image.asset(
                      ImageAssetsManager.discount,
                      width: 60.w,
                      height: 60.h,
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Text(
              '${translateDataBase(products.productNameAr, products.productNameEn)}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  Theme.of(context).textTheme.labelSmall!.copyWith(height: 1.2),
            ),
            Row(
              children: [
                Text(
                  '\$${products.productNewPrice}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.w600, height: 1.2),
                ),
                SizedBox(
                  width: 15.w,
                ),
                if (products.productDiscount != '0')
                  Text(
                    '\$${products.productOldPrice}',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: ColorsManager.black.withOpacity(.6),
                        fontWeight: FontWeight.w500,
                        height: 1.2),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
