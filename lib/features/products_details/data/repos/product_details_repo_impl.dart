// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:e_commerce_app/core/class/api/api_service.dart';
import 'package:e_commerce_app/core/class/api/failures.dart';
import 'package:e_commerce_app/core/constants/api_links.dart';
import 'package:e_commerce_app/features/products_details/data/models/color_model/product_colors_model.dart';
import 'package:e_commerce_app/features/products_details/data/models/size_model/product_size_model.dart';
import 'package:e_commerce_app/features/products_details/data/repos/product_details_repo.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepo {
  ApiService apiService;
  ProductDetailsRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, ProductColorsModel>> getProductColor(
      String productID) async {
    try {
      var response = await apiService
          .postData(ApiLinks.getProductColor, {'productid': productID});
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(ProductColorsModel.fromJson(data));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, ProductSizeModel>> getProductSize(
      String productID) async {
    try {
      var response = await apiService
          .postData(ApiLinks.getProductSize, {'productid': productID});
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(ProductSizeModel.fromJson(data));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }
}
