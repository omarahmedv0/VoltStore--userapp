import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets/icon_assets_manager.dart';
import '../../../../injections.dart';
import '../../../cart/presentation/view/screens/cart_screen.dart';
import '../../../cart/presentation/view_data/cubit/cart_cubit.dart';
import '../../../favorite/presentation/view/screeens/favorite_screen.dart';
import '../../../home/view/screens/home_screen.dart';
import '../../../profile/presentation/view/screens/profile_screen.dart';
import '../../../profile/presentation/view_data/cubit/profile_cubit.dart';

part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLayoutInitial());
  static AppLayoutCubit get(context) {
    return BlocProvider.of(context);
  }

  List<Widget> listPages = [
    const HomeScreen(),
    const FavoriteScreen(),
     BlocProvider(
      create: (context) => getIt.get<CartCubit>()..getCartData(),
      child: const CartScreen(),
    ),
    BlocProvider(
      create: (context) => getIt.get<ProfileCubit>(),
      child: const ProfileScreen(),
    )
  ];
  List<String> iconPages = [
    IconsAssetsManager.home,
    IconsAssetsManager.heart,
    IconsAssetsManager.cart,
    IconsAssetsManager.profile,
  ];
  int currentPage = 0;
  changeCurrentPage(int index) {
    currentPage = index;
    emit(ChangeCurrentpage());
  }
}
