// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/api/api_service.dart';
import 'package:e_commerce_app/core/class/api/failures.dart';
import 'package:e_commerce_app/core/constants/api_links.dart';
import 'package:e_commerce_app/features/auth/data/model/user_model/user_model.dart';
import 'package:e_commerce_app/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  ApiService apiService;
  ProfileRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, UserModel>> editProfile(String userid, String name,
      String email, String phone, String password, String oldImage,
      {File? file}) async {
    Either<Failure, Map> response;
    try {
      if (file == null) {
        response = await apiService.postData(ApiLinks.editProfile, {
          'userid': userid,
          'username': name,
          'email': email,
          'phone': phone,
          'password': password,
          'oldimage': oldImage,
        });
      } else {
       response = await apiService.postwithSingleImage(
          ApiLinks.editProfile,
          {
            'userid': userid,
            'username': name,
            'email': email,
            'phone': phone,
            'password': password,
            'oldimage': oldImage,
          },
          file,
        );
      }
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(UserModel.fromJson(data));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
