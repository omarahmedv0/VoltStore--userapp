import '../../../../../core/functions/check_product_color.dart';
import '../../../../../core/functions/check_product_size.dart';
import '../../../../../core/functions/translate_database.dart';
import '../../../data/models/cart/cart_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/colors_manager.dart';

class CustomCartProductDtails extends StatelessWidget {
  const CustomCartProductDtails({
    super.key,
    required this.productData,
  });

  final CartProducts productData;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
       
          Text(
            translateDataBase( productData.productNameAr,  productData.productNameEn!)
           ,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 14.sp, overflow: TextOverflow.ellipsis, height: 1.2),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 5.w,
                ),
                decoration: BoxDecoration(
                  color: ColorsManager.white,
                  borderRadius: BorderRadius.circular(
                    180,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    .7,
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: ColorsManager.black,
                    child: Text(
                      checkProductSize(productData.productSize!),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 10,
                            color: ColorsManager.white,
                          ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: checkProductColor(
                      productData.productColor!,
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
              Text(
                '\$${productData.totalprice}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: ColorsManager.black,
                      fontWeight: FontWeight.w900,
                      height: 1.5,
                      fontSize: 14.sp,
                    ),
              ),
              SizedBox(
                width: 10.w,
              ),
              if (productData.productDescount != '0')
                Text(
                  '\$${int.parse(productData.productOldprice!) * int.parse(productData.countitems!)}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: ColorsManager.black.withOpacity(.6),
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
