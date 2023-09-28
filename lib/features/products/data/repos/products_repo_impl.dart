import 'package:dartz/dartz.dart';

import '../../../../core/class/api/api_service.dart';
import '../../../../core/class/api/failures.dart';
import '../../../../core/constants/api_links.dart';
import '../models/products_data_model.dart';
import 'products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ApiService _apiService;

  ProductsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, ProductsDataModel>> getProductsData(
      String categoryID, String userId) async {
    try {
      var response = await _apiService.postData(ApiLinks.productsLink, {
        'category_id': categoryID,
        'userid': userId,
      });

      return response.fold((failere) {
        return left(failere);
      }, (productsDataModel) {
        return right(
          (ProductsDataModel.fromJson(
            productsDataModel,
          )),
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
