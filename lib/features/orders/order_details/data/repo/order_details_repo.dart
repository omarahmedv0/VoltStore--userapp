import 'package:dartz/dartz.dart';

import '../../../../../core/class/api/failures.dart';
import '../models/order_details_model/order_details_model.dart';

abstract class OrderDetailsRepo {
  Future<Either<Failure, OrderDetailsModel>> getOrderDetails(
    String orderID,
    String userID,
  );
}
