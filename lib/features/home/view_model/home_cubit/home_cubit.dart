// ignore_for_file: avoid_print
import 'package:e_commerce_app/core/constants/route_manager.dart';
import 'package:e_commerce_app/core/functions/init_app.dart';
import 'package:e_commerce_app/features/home/data/model/home/categories_data.dart';
import 'package:e_commerce_app/features/home/data/model/home/home_data_model.dart';
import 'package:e_commerce_app/features/home/data/model/home/popular_products.dart';
import 'package:e_commerce_app/features/home/data/repos/home_repos_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/class/api/api_errors.dart';
import '../../../../core/functions/navigation/to_named.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl _homeRepoImpl ;
  HomeCubit(this._homeRepoImpl) : super(HomeInitial());
  static HomeCubit get(context) {
    return BlocProvider.of(context);
  }

  HomeDataModel homeData = HomeDataModel();

  Future<void> getHomeData(context) async {
    emit(GetHomeDataLoading());
    var response = await _homeRepoImpl.getHomeData(sharedPreferences.getString("userID")!);
    response.fold((failure) {
      emit(GetHomeDataFailere(failure.errMessage, failure.apiErrors));
    }, (homeDataModel) {
      homeData = homeDataModel;
      emit(GetHomeDataSuccess());
    });
  }

  goToProductDetailsScreen(context, PopularProductsModel popular) {
    toNamed(context, RouteManager.productsDetails, arguments: {
      'productsDetails': popular,
    });
  }

  setCategorySelectedIndex(int categorySelectedIndex) {
    sharedPreferences.setInt('categorySelectedIndex', categorySelectedIndex);
  }

  setCategorySelectedId(String categorySelectedId) {
    sharedPreferences.setString('categorySelectedId', categorySelectedId);
  }

  goToProductsScreen(BuildContext context, List<Categories> categories) {
    toNamed(context, RouteManager.products, arguments: {
      'categories': categories,
    });
  }

  toSearchScreen(context){
     toNamed(context, RouteManager.search,);
  }
    toNotificationsScreen(context){
     toNamed(context, RouteManager.notifications,);
  }
}
