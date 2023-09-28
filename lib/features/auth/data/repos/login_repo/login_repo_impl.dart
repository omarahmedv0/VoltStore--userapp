import 'package:dartz/dartz.dart';

import '../../../../../core/class/api/api_service.dart';
import '../../../../../core/class/api/failures.dart';
import '../../../../../core/constants/api_links.dart';
import '../../model/user_model/user_model.dart';
import 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService _apiService ;
  LoginRepoImpl(this._apiService);

  @override
  Future<Either<Failure, UserModel>> login(
      String password, String email) async {
    try {
      var response = await _apiService
          .postData(ApiLinks.loginLink, {"password": password, "email": email});

      return response.fold((failure) {
        return left(failure);
      }, (userModel) {
        return right(UserModel.fromJson(userModel));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }
}
