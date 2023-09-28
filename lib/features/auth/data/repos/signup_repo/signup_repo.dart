import 'package:dartz/dartz.dart';

import '../../../../../core/class/api/failures.dart';
import '../../model/user_model/user_model.dart';

abstract class SignupRepo {
  Future<Either<Failure,UserModel>> signup(
      String password, String email, String phone, String name);
}