import 'package:dartz/dartz.dart';

import '../../../../../core/class/api/failures.dart';
import '../../models/shipping_cost_model/shipping_cost_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, String>> checkout(
    String addressID,
    String userID,
    String couponID,
    String subPrice,
    String discount,
    String deliveryPrice,
    String paymentMethod,
  );

  Future<Either<Failure, ShippingCostModel>> getShippingCost(
    String cityID,
  );
}
