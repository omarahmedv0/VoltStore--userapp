import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../models/color_model/product_colors_model.dart';
import '../models/size_model/product_size_model.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure,ProductColorsModel>> getProductColor(String productID);
    Future<Either<Failure,ProductSizeModel>> getProductSize(String productID);

}