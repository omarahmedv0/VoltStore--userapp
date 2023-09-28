import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../favorite/presentation/view_data/cubit/favorite_cubit.dart';
import '../../data/model/home/popular_products.dart';
import 'custom_item_products_home.dart';

class ListOfProductsHome extends StatelessWidget {
  const ListOfProductsHome({
    super.key,
    required this.products,
  });

  final List<PopularProductsModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 15.w,
      childAspectRatio: .89.h / 1.80.w,
      crossAxisCount: 2,
      mainAxisSpacing: MediaQuery.of(context).size.height /300,
      children: List.generate(products.length, (i) {
         FavoriteCubit.get(context).setisFavoriteData(
          context,
          products[i].productId!,
          products[i].isFav!,
        );
        return CustomItemProductsHome(
          popular: products[i],
        );
      }),
    );
  }
}
