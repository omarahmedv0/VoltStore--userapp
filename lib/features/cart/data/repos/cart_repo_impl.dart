import 'package:dartz/dartz.dart';

import '../../../../core/class/api/api_service.dart';
import '../../../../core/class/api/failures.dart';
import '../../../../core/constants/api_links.dart';
import '../models/cart/cart_model.dart';
import '../models/coupon/coupon_model.dart';
import 'cart_repo.dart';

class CartRepoImpl implements CartRepo {
  CartRepoImpl(this._apiService);
  final ApiService _apiService;
  @override
  addCart(String productId, String userId, String qty, String color,
      String size) async {
    try {
      var response = await _apiService.postData(ApiLinks.addCartLink, {
        "product_id": productId,
        "user_id": userId,
        'product_quantity': qty,
        'product_color': color,
        'product_size': size,
      });
      return response.fold((l) => l, (r) => r);
    } on ServerFailere catch (e) {
      return ServerFailere.checkonErrormessage(e.errMessage);
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCartData(String userID) async {
    try {
      var response = await _apiService.postData(ApiLinks.getCartLink, {
        "user_id": userID,
      });
      return response.fold(
        (failere) => left(
          failere,
        ),
        (cartModel) => right(CartModel.fromJson(
          cartModel,
        )),
      );
    } on ServerFailere catch (e) {
      return left(ServerFailere.checkonErrormessage(e.errMessage));
    }
  }



  @override
  Future<Either<Failure, CouponModel>> checkCoupon(String couponName) async {
    try {
      var response = await _apiService.postData(ApiLinks.checkCoupon, {
        "coupon_name": couponName,
      });
      return response.fold((failere) {
        return left(
          failere,
        );
      }, (coupondata) {
        return right(CouponModel.fromJson(coupondata));
      });
    } on ServerFailere catch (e) {
      return left(ServerFailere.checkonErrormessage(e.errMessage));
    }
  }

  @override
  decreaseQuantity(
      String productId, String userId, String color, String size) async {
    try {
      var response = await _apiService.postData(ApiLinks.decreaseQuantity, {
        "product_id": productId,
        "user_id": userId,
        'product_color': color,
        'product_size': size,
      });
      return response.fold((l) => l, (r) => r);
    } on ServerFailere catch (e) {
      return ServerFailere.checkonErrormessage(e.errMessage);
    }
  }

  @override
  increaseQuantity(
      String productId, String userId, String color, String size) async {
    try {
      var response = await _apiService.postData(ApiLinks.increaseQuantity, {
        "product_id": productId,
        "user_id": userId,
        'product_color': color,
        'product_size': size,
      });
      return response.fold((l) => l, (r) => r);
    } on ServerFailere catch (e) {
      return ServerFailere.checkonErrormessage(e.errMessage);
    }
  }
  
  @override
  deleteCart(String productId, String userId, String color, String size) async{
    try {
      var response = await _apiService.postData(ApiLinks.deleteCartLink, {
        "product_id": productId,
        "user_id": userId,
        'product_color': color,
        'product_size': size,
      });
      return response.fold((l) => l, (r) => r);
    } on ServerFailere catch (e) {
      return ServerFailere.checkonErrormessage(e.errMessage);
    }
  }
}
