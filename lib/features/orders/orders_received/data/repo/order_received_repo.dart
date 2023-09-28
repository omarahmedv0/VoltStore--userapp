import 'package:dartz/dartz.dart';

import '../../../../../core/class/api/failures.dart';
import '../../../shared/models/order_model/order_model.dart';

abstract class OrderReceivedRepo {
   Future<Either<Failure, OrderModel>> getOrdersReceived(String userId);
}