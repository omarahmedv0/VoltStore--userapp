import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../models/myrating_model/myrating_model.dart';
import '../models/products_reviews/products_reviews_model.dart';
import '../models/rating_model.dart';

abstract class RatingRepo {
  Future<Either<Failure, MyratingModel>> getMyRatingData(
    String userID,
  );
  Future<Either<Failure, ProductsReviewsModel>> getProductReviewsData(
    String productID,
  );
  Future<Either<Failure, RatingModel>> getRatingData();
  Future<Either<Failure, Map<String, dynamic>>> submitRate(
    String userID,
    String productID,
    String star,
    String comment,
  );

    Future<Either<Failure, Map<String, dynamic>>> editRate(
    String userID,
    String productID,
    String star,
    String comment,
  );
}
