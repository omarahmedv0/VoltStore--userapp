import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/class/api/failures.dart';
import '../../../auth/data/model/user_model/user_model.dart';

abstract class ProfileRepo {
   Future<Either<Failure,UserModel>> editProfile(String userid,String name , String email , String phone , String password, String oldImage,  {File? file});
}