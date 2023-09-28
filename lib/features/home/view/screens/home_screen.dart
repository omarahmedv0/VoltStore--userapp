import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/class/handling/handling_state_view.dart';
import '../../../../core/constants/api_links.dart';
import '../../../../core/constants/colors_manager.dart';
import '../../view_model/home_cubit/home_cubit.dart';
import '../widgets/custom_appbar_home.dart';
import '../widgets/custom_list_of_products_home.dart';
import '../widgets/list_of_categories_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorsManager.white,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomAppBarHome(),
                  CarouselSlider(
                    items: cubit.homeData.banners
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  image: NetworkImage(
                                      '${ApiLinks.bannersImageLink}/${e.bannerImage}'),
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: 170,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      initialPage: 0,
                      viewportFraction: 1.0,
                      reverse: false,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  HandlingStateView(
                    conditionEmpty: cubit.homeData.categories.isEmpty ||
                        cubit.homeData.popular.isEmpty,
                    conditionError: state is GetHomeDataFailere,
                    conditionLoading: state is GetHomeDataLoading,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListOfCategoriesHome(
                          categories: cubit.homeData.categories,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '82'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: ColorsManager.black.withOpacity(.6)),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ListOfProductsHome(
                          products: cubit.homeData.popular,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
