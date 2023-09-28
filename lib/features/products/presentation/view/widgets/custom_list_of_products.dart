import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../favorite/presentation/view_data/cubit/favorite_cubit.dart';
import '../../../data/models/products_data.dart';
import 'custom_item_products_screen.dart';

class ListOfProducts extends StatelessWidget {
  const ListOfProducts({
    super.key,
    required this.products,
  });

  final List<ProductsData> products;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 15,
      childAspectRatio: .89.h / 1.80.w,
      crossAxisCount: 2,
      mainAxisSpacing: MediaQuery.of(context).size.height /300,
      children: List.generate(products.length, (i) {
          FavoriteCubit.get(context).setisFavoriteData(
          context,
          products[i].productId!,
          products[i].isFav!,
        );
        return CustomItemProductsScreen(
          products: products[i],
        );
      }),
    );
  }
}
