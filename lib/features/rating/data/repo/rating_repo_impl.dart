// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_renaming_method_parameters
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/api/api_service.dart';
import 'package:e_commerce_app/core/class/api/failures.dart';
import 'package:e_commerce_app/core/constants/api_links.dart';
import 'package:e_commerce_app/features/rating/data/models/myrating_model/myrating_model.dart';
import 'package:e_commerce_app/features/rating/data/models/products_reviews/products_reviews_model.dart';
import 'package:e_commerce_app/features/rating/data/models/rating_model.dart';
import 'package:e_commerce_app/features/rating/data/repo/rating_repo.dart';

class RatingRepoImpl extends RatingRepo {
  ApiService apiService;
  RatingRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, MyratingModel>> getMyRatingData(String userID) async {
    try {
      var response = await apiService.postData(ApiLinks.myRating, {
        'userid': userID,
      });
      return response.fold((failere) {
        return left(failere);
      }, (myratingData) {
        return right(MyratingModel.fromJson(
          myratingData,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> submitRate(
    String userID,
    String productID,
    String star,
    String? comment,
  ) async {
    try {
      var response = await apiService.postData(ApiLinks.addRate, {
        'userid': userID,
        'productid': productID,
        'star': star,
        'comment': comment,
      });
      return response.fold((failere) {
        return left(failere);
      }, (success) {
        return right(success);
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, ProductsReviewsModel>> getProductReviewsData(
      String productID) async {
    try {
      var response = await apiService.postData(ApiLinks.productRating, {
        'productid': productID,
      });
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(ProductsReviewsModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, RatingModel>> getRatingData() async {
    try {
      var response = await apiService.getData(ApiLinks.getRating);
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(RatingModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> editRate(
      String userID, String productID, String star, String comment) async {
    try {
      var response = await apiService.postData(ApiLinks.editRate, {
        'userid': userID,
        'productid': productID,
        'star': star,
        'comment': comment,
      });
      return response.fold((failere) {
        return left(failere);
      }, (success) {
        return right(success);
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
