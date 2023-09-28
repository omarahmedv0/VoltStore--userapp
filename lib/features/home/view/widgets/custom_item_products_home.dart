// ignore_for_file: must_be_immutable
import 'package:e_commerce_app/core/constants/assets/image_assets_manager.dart';
import 'package:e_commerce_app/features/favorite/presentation/view_data/cubit/favorite_cubit.dart';
import 'package:e_commerce_app/features/home/data/model/home/popular_products.dart';
import 'package:e_commerce_app/features/home/view_model/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/features/products_details/presentation/view_model/cubit/product_details_cubit.dart';
import 'package:e_commerce_app/features/rating/presentation/view_data/products_reviews_cubit/products_reviews_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/api_links.dart';
import '../../../../core/constants/assets/icon_assets_manager.dart';
import '../../../../core/constants/colors_manager.dart';
import '../../../../core/functions/translate_database.dart';

class CustomItemProductsHome extends StatelessWidget {
  CustomItemProductsHome({
    super.key,
    required this.popular,
  });

  PopularProductsModel popular;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await ProductsReviewsCubit.get(context)
            .getProductReviewsData(
          popular.productId!,
        )
            .then((value) {
          ProductDetailsCubit.get(context).getProductColors(popular.productId!);
          ProductDetailsCubit.get(context).getProductSize(popular.productId!);
        }).then((value) {
          HomeCubit.get(context).goToProductDetailsScreen(context, popular);
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
                    tag: popular.productId!,
                    child: Image.network(
                      '${ApiLinks.productsImagesLink}/${popular.productImage}',
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
                    backgroundColor: cubit.isFavorite[popular.productId] == '1'
                        ? ColorsManager.primary
                        : ColorsManager.white,
                    child: IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        cubit.changeStateIconFav(popular.productId!, context);
                      },
                      icon: Image.asset(
                        IconsAssetsManager.heart,
                        color: cubit.isFavorite[popular.productId] == '1'
                            ? ColorsManager.white
                            : ColorsManager.primary,
                        height: 25.h,
                        width: 25.w,
                      ),
                    ),
                  );
                },
              ),
              if (popular.productDiscount != '0')
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
            '${translateDataBase(popular.productNameAr, popular.productNameEn)}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                Theme.of(context).textTheme.labelSmall!.copyWith(height: 1.2),
          ),
          Row(
            children: [
              Text(
                '\$${translateDataBase(popular.productOldPrice, popular.productNewPrice)}',
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
              if (popular.productDiscount != '0')
                Text(
                  '\$${popular.productOldPrice}',
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
    );
  }
}
