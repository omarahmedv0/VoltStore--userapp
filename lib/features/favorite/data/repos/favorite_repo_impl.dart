import 'package:dartz/dartz.dart';

import '../../../../core/class/api/api_service.dart';
import '../../../../core/class/api/failures.dart';
import '../../../../core/constants/api_links.dart';
import '../models/favorite_model.dart';
import 'favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final ApiService _apiService ;
    FavoriteRepoImpl(this._apiService);

  @override
  addProducttoFav(String productId, String userId) async {
    try {
      var response = await _apiService.postData(ApiLinks.addFavLink, {
        "product_id": productId,
        "user_id": userId,
      });
      return response.fold((l) => l, (r) => r);
    } on ServerFailere catch (e) {
      return ServerFailere.checkonErrormessage(e.errMessage);
    }
  }

  @override
  deleteProducttoFav(String productId, String userId) async {
    try {
      var response = await _apiService.postData(ApiLinks.deleteFavLink, {
        "product_id": productId,
        "user_id": userId,
      });
      return response.fold((l) => l, (r) => r);
    } on ServerFailere catch (e) {
      return ServerFailere.checkonErrormessage(e.errMessage);
    }
  }

  @override
  Future<Either<Failure, FavoriteModel>> getFavoriteData(String userID) async {
    try {
      var response = await _apiService
          .postData(ApiLinks.getFavoriteLink, {"user_id": userID});
      return response.fold(
        (failere) => left(failere),
        (favoriteModel) => right(
          FavoriteModel.fromJson(favoriteModel),
        ),
      );
    } on ServerFailere catch (e) {
      return left(ServerFailere.checkonErrormessage(e.errMessage));
    }
  }
}
