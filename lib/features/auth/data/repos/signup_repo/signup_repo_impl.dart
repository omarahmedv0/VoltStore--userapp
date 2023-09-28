import 'package:dartz/dartz.dart';

import '../../../../../core/class/api/api_service.dart';
import '../../../../../core/class/api/failures.dart';
import '../../../../../core/constants/api_links.dart';
import '../../model/user_model/user_model.dart';
import 'signup_repo.dart';

class SignupRepoImpl implements SignupRepo {
  final ApiService apiService ;
  SignupRepoImpl(this.apiService);
  @override
  Future<Either<Failure, UserModel>> signup(
      String password, String email, String phone, String name) async {
    try {
      var response = await apiService.postData(ApiLinks.signupLink, {
        "username": name,
        "password": password,
        "email": email,
        "phone": phone,
      });
     return response.fold((l) {
        return left(l);
      }, (userModel) {
       return right(UserModel.fromJson(userModel));
      });
    } on Failure catch (e) {
      return left(e);
    }
  }
}
