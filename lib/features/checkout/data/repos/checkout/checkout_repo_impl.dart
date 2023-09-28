// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/api/api_service.dart';
import 'package:e_commerce_app/features/checkout/data/models/shipping_cost_model/shipping_cost_model.dart';
import 'package:e_commerce_app/features/checkout/data/repos/checkout/checkout_repo.dart';

import '../../../../../core/class/api/failures.dart';
import '../../../../../core/constants/api_links.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  ApiService apiService;
  CheckoutRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, String>> checkout(
    String addressID,
    String userID,
    String couponID,
    String subPrice,
    String discount,
    String deliveryPrice,
    String paymentMethod,
  ) async {
    try {
      var response = await apiService.postData(ApiLinks.checkout, {
        'user_id': userID,
        'address_id': addressID,
        'couponid': couponID,
        'delivery_price': deliveryPrice,
        'sub_price': subPrice,
        'payment_method': paymentMethod,
        'discount': discount,
      });
      return response.fold((failere) {
        return left(failere);
      }, (success) {
        return right(
          success['status'],
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, ShippingCostModel>> getShippingCost(
      String cityID) async {
    try {
      var response = await apiService.postData(ApiLinks.getShippingCost, {
        'city_id': cityID,
      });
      return response.fold((failere) {
        return left(failere);
      }, (success) {
        return right(ShippingCostModel.fromJson(success));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
