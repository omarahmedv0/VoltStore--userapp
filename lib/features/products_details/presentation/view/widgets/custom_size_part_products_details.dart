import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/colors_manager.dart';
import '../../../../../core/functions/check_product_size.dart';
import '../../view_model/cubit/product_details_cubit.dart';

// ignore: must_be_immutable
class CustomSizePartProductDetails extends StatelessWidget {
  CustomSizePartProductDetails({
    super.key,
    required this.size,
  });

  List<String> size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        var cubit = ProductDetailsCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ...List.generate(
                  size.length,
                  (index) => InkWell(
                    onTap: () {
                      cubit.changeCurrentSize(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        right: 5.w,
                      ),
                      decoration: BoxDecoration(
                        color: cubit.sizeSelectedIndex == index
                            ? ColorsManager.white
                            : ColorsManager.black,
                        borderRadius: BorderRadius.circular(
                          180,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                          .7,
                        ),
                        child: CircleAvatar(
                          backgroundColor: cubit.sizeSelectedIndex == index
                              ? ColorsManager.black
                              : ColorsManager.white,
                          child: Text(
                            checkProductSize(size[index]),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: cubit.sizeSelectedIndex == index
                                      ? ColorsManager.white
                                      : ColorsManager.black,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
