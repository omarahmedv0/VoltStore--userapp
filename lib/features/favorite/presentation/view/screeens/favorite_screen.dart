import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/class/handling/handling_state_view.dart';
import '../../../../../core/shared/widgets/custom_appbar.dart';
import '../../view_data/cubit/favorite_cubit.dart';
import '../widgets/custom_list_for_favorites.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        var cubit = FavoriteCubit.get(context);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 15.h,
              ),
              CustomAppBar(
                  ispadding: false,
                title: '84'.tr,
                isleading: false,
              ),
              SizedBox(
                height: 15.h,
              ),
              HandlingStateView(
                conditionEmpty: cubit.favoriteData.favorite.isEmpty,
                conditionError: state is GetFavoriteDataFailere,
                conditionLoading: state is GetFavoriteDataLoading,
                child: CustomListforFavorites(
                  favoriteModel: cubit.favoriteData,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
