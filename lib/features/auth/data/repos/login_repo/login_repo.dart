import 'package:dartz/dartz.dart';

import '../../../../../core/class/api/failures.dart';
import '../../model/user_model/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> login(String password, String email);
}
