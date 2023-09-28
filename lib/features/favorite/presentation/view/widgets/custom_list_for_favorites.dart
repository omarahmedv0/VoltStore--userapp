import 'package:flutter/material.dart';

import '../../../data/models/favorite_model.dart';
import 'custom_item_for_favorites.dart';

// ignore: must_be_immutable
class CustomListforFavorites extends StatelessWidget {
   CustomListforFavorites({
    super.key,
    required this.favoriteModel
  });
  FavoriteModel favoriteModel;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 15,
      childAspectRatio: .88 / 1.80,
      crossAxisCount: 2,
      mainAxisSpacing: MediaQuery.of(context).size.height /300,
      children: List.generate(favoriteModel.favorite.length, (i) {
        return CustomItemforFavorites(
          favorite: favoriteModel.favorite[i],
        );
      }),
    );
  }
}
