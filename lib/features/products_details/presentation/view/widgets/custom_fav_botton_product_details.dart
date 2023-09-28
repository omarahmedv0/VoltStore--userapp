// ignore_for_file: must_be_immutable

import 'package:e_commerce_app/features/favorite/presentation/view_data/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/assets/icon_assets_manager.dart';
import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/models/products.dart';

class CustomFavBottonProductDetails extends StatelessWidget {
  CustomFavBottonProductDetails({
    super.key,
    required this.productDetails,
  });
  Products productDetails;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        var cubit = FavoriteCubit.get(context);
        return Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: cubit.isFavorite[productDetails.productId] == '1'
                  ? ColorsManager.primary
                  : ColorsManager.white,
              borderRadius: BorderRadius.circular(180),
            ),
            child: MaterialButton(
              padding: EdgeInsets.zero,
              height: 10,
              minWidth: 10,
              onPressed: () {
                cubit.changeStateIconFav(
                  productDetails.productId!,
                  context,
                );
              },
              child: Image.asset(
                IconsAssetsManager.heart,
                width: 20,
                height: 20,
                color: cubit.isFavorite[productDetails.productId] == '1'
                    ? ColorsManager.white
                    : ColorsManager.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
