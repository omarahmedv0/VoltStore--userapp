import 'package:dartz/dartz.dart';

import '../../../../../core/class/api/failures.dart';

abstract class PaymentRepo {
  Future<Either<Failure, Map>> getClintSecretKey(
      String amount, String currency);
}
