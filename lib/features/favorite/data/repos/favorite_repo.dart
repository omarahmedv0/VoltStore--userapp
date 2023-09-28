import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../models/favorite_model.dart';

abstract class FavoriteRepo {
   addProducttoFav(String productId,String userId );
   deleteProducttoFav(String productId,String userId );
   Future<Either<Failure,FavoriteModel>> getFavoriteData(String userID);
}
