import 'package:dartz/dartz.dart';

import '../../../../../core/class/api/failures.dart';
import '../../../shared/models/order_model/order_model.dart';

abstract class MyordersRepo {
  Future<Either<Failure, OrderModel>> getOrders(String userID);

 Future<Either<Failure, Map<String,dynamic>>> cancelOrder(String orderID);
}
