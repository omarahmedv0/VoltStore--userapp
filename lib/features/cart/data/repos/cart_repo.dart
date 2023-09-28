import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../models/cart/cart_model.dart';
import '../models/coupon/coupon_model.dart';

abstract class CartRepo {
  addCart(
      String productId, String userId, String qty, String color, String size);
       deleteCart(
      String productId, String userId, String color, String size);
  decreaseQuantity(String productId, String userId, String color, String size);
  increaseQuantity(String productId, String userId, String color, String size);
  Future<Either<Failure, CartModel>> getCartData(String userID);
  Future<Either<Failure, CouponModel>> checkCoupon(String couponName);
}
