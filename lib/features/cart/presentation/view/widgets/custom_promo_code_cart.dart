
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors_manager.dart';
import 'custom_botton_promo_code_part.dart';
import 'custom_text_field_cart.dart';

class CustomPromoCodeCart extends StatelessWidget {
  const CustomPromoCodeCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: ColorsManager.grey.withOpacity(
          .2,
        ),
      ),
      child: const Row(
        children: [
          CustomTextFieldCart(),
          CustomBottonPromoCodePart(),
        ],
      ),
    );
  }
}

