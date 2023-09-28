import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../models/products_data_model.dart';

abstract class ProductsRepo {
  Future<Either<Failure, ProductsDataModel>> getProductsData(String categoryID,String userId);
}
