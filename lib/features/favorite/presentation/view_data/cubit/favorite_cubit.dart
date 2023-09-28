import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/class/api/api_errors.dart';
import '../../../../../core/constants/route_manager.dart';
import '../../../../../core/functions/custom_snack_bar.dart';
import '../../../../../core/functions/init_app.dart';
import '../../../../../core/functions/navigation/to_named.dart';
import '../../../../home/view_model/home_cubit/home_cubit.dart';
import '../../../data/models/favorite_data.dart';
import '../../../data/models/favorite_model.dart';
import '../../../data/repos/favorite_repo_impl.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepoImpl _favoriteRepoImpl;
  FavoriteCubit(this._favoriteRepoImpl) : super(FavoriteInitial());
  static FavoriteCubit get(context) {
    return BlocProvider.of(context);
  }

  Map isFavorite = {};
  setisFavoriteData(context, String productId, String isFav) {
    isFavorite[productId] = isFav;
  }

  FavoriteModel favoriteData = FavoriteModel();

  changeStateIconFav(String productId, context) async {
    if (isFavorite[productId] == '1') {
      isFavorite[productId] = '0';
      await removeProductFromFav(productId, context);
    } else {
      isFavorite[productId] = '1';
      await addProductToFav(productId, context);
    }
  }

  addProductToFav(productId, context) async {
    var response = await _favoriteRepoImpl.addProducttoFav(
      productId,
      sharedPreferences.getString("userID")!,
    );

    if (response['status'] == 'success') {
      customSnackBar(
        context,
        '85'.tr,
        AnimatedSnackBarType.success,
        30,
      );
      getFavoriteData();
      HomeCubit.get(context).getHomeData(context);
      emit(AddedFavSuccessfully());
    } else {
      customSnackBar(
        context,
        '87'.tr,
        AnimatedSnackBarType.error,
        30,
      );
      emit(AddedFavFailere());
    }
  }

  removeProductFromFav(productId, context) async {
    var response = await _favoriteRepoImpl.deleteProducttoFav(
      productId,
      sharedPreferences.getString("userID")!,
    );
    if (response['status'] == 'success') {
      customSnackBar(
        context,
        '86'.tr,
        AnimatedSnackBarType.success,
        30,
      );

      favoriteData.favorite.removeWhere(
        (element) => element.productId == productId,
      );
      HomeCubit.get(context).getHomeData(context);

      emit(DeletedFavSuccessfully());
    } else {
      customSnackBar(
        context,
        '87'.tr,
        AnimatedSnackBarType.error,
        30,
      );
      emit(DeletedFavFailere());
    }
  }

  getFavoriteData() async {
    emit(GetFavoriteDataLoading());
    var response = await _favoriteRepoImpl.getFavoriteData(
      sharedPreferences.getString("userID")!,
    );
    response.fold((failere) {
      emit(GetFavoriteDataFailere(failere.errMessage, failere.apiErrors));
    }, (favorites) {
      favoriteData = favorites;
      emit(GetFavoriteDataSuccess(favorites));
    });
  }

  goToProductDetailsScreen(context, FavoriteProductsData products) {
    toNamed(context, RouteManager.productsDetails, arguments: {
      'productsDetails': products,
    });
  }
}
