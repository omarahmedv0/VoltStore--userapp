import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/api_links.dart';
import '../../../../../core/constants/assets/image_assets_manager.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../../data/models/favorite_data.dart';
import '../../view_data/cubit/favorite_cubit.dart';

// ignore: must_be_immutable
class CustomItemforFavorites extends StatelessWidget {
  CustomItemforFavorites({super.key, required this.favorite});
  FavoriteProductsData favorite;
  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, FavoriteState>(
      listener: (context, state) {},
      child: InkWell(
        onTap: () {
          FavoriteCubit.get(context)
              .goToProductDetailsScreen(context, favorite);
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
                      tag: favorite.productId!,
                      child: Image.network(
                        '${ApiLinks.productsImagesLink}/${favorite.productImage}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  splashRadius: 1,
                  onPressed: () {
                    FavoriteCubit.get(context)
                        .removeProductFromFav(favorite.productId, context);
                  },
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: ColorsManager.red,
                  ),
                ),
                 if(favorite.productDiscount != '0')
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
              translateDataBase(
                favorite.productNameAr!,
                favorite.productNameEn!,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Row(
              children: [
                Text(
                  '\$${favorite.productNewPrice}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 10.w,
                ),
                 if (favorite.productDiscount != '0')
                Text(
                  '\$${favorite.productOldPrice}',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: ColorsManager.black.withOpacity(.6),
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
