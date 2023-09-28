
import '../../../../../core/constants/colors_manager.dart';
import '../../../data/models/cart/cart_products.dart';
import '../../view_data/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';

class CustomBottonRemoveItemFromCart extends StatelessWidget {
  const CustomBottonRemoveItemFromCart({
    super.key,
    required this.productData,
  });

  final CartProducts productData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          CartCubit.get(context).deleteCart(
            productData.productId,
            productData.productColor!,
            productData.productSize!,
            context,
          );
        },
        child: const Icon(
          Icons.delete_forever_outlined,
          color: ColorsManager.red,
        ));
  }
}